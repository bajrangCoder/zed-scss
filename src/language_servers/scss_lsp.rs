use std::{env, fs};

use semver::Version;
use zed_extension_api::{self as zed, settings::LspSettings, LanguageServerId, Result};

use super::merge_json_value;

const SERVER_PATH: &str =
    "node_modules/vscode-langservers-extracted/bin/vscode-css-language-server";
const SERVER_BINARY_NAME: &str = "vscode-css-language-server";
const PACKAGE_NAME: &str = "vscode-langservers-extracted";

fn server_binary_arguments(server_path: &str) -> Result<Vec<String>> {
    let server_path = env::current_dir()
        .map_err(|error| format!("failed to determine extension working directory: {error}"))?
        .join(server_path);

    Ok(vec![
        server_path.to_string_lossy().into_owned(),
        "--stdio".to_string(),
    ])
}

fn default_initialization_options() -> zed::serde_json::Value {
    zed::serde_json::json!({
        "provideFormatter": true
    })
}

fn workspace_configuration(
    override_options: Option<zed::serde_json::Value>,
) -> zed::serde_json::Value {
    let mut default_config = zed::serde_json::json!({
        "css": {
            "lint": {}
        },
        "less": {
            "lint": {}
        },
        "scss": {
            "lint": {}
        }
    });

    if let Some(override_options) = override_options {
        merge_json_value(&mut default_config, override_options);
    }

    default_config
}

fn should_install_server(
    server_exists: bool,
    installed_version: Option<&str>,
    latest_version: &Version,
) -> bool {
    if !server_exists {
        return true;
    }

    let Some(installed_version) =
        installed_version.and_then(|version| Version::parse(version).ok())
    else {
        return true;
    };
    installed_version < *latest_version
}

pub struct SCSSLsp {
    did_find_server: bool,
}

impl SCSSLsp {
    pub const LANGUAGE_SERVER_ID: &'static str = "scss-lsp";

    pub fn new() -> Self {
        Self {
            did_find_server: false,
        }
    }

    pub fn language_server_command(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        if let Some(path) = worktree.which(SERVER_BINARY_NAME) {
            return Ok(zed::Command {
                command: path,
                args: vec!["--stdio".to_string()],
                env: worktree.shell_env(),
            });
        }

        let server_path = self.server_script_path(language_server_id)?;
        Ok(zed::Command {
            command: zed::node_binary_path()?,
            args: server_binary_arguments(&server_path)?,
            env: Default::default(),
        })
    }

    fn server_exists(&self) -> bool {
        fs::metadata(SERVER_PATH).is_ok_and(|stat| stat.is_file())
    }

    fn server_script_path(&mut self, language_server_id: &LanguageServerId) -> Result<String> {
        let server_exists = self.server_exists();
        if self.did_find_server && server_exists {
            return Ok(SERVER_PATH.to_string());
        }

        zed::set_language_server_installation_status(
            language_server_id,
            &zed::LanguageServerInstallationStatus::CheckingForUpdate,
        );
        let version = match zed::npm_package_latest_version(PACKAGE_NAME) {
            Ok(version) => version,
            Err(_) if server_exists => {
                self.did_find_server = true;
                return Ok(SERVER_PATH.to_string());
            }
            Err(error) => return Err(error),
        };
        let latest_version = match Version::parse(&version) {
            Ok(version) => version,
            Err(_) if server_exists => {
                self.did_find_server = true;
                return Ok(SERVER_PATH.to_string());
            }
            Err(error) => {
                return Err(format!(
                    "invalid latest version '{version}' for package '{PACKAGE_NAME}': {error}"
                ));
            }
        };
        let installed_version = zed::npm_package_installed_version(PACKAGE_NAME)
            .ok()
            .flatten();

        if should_install_server(server_exists, installed_version.as_deref(), &latest_version) {
            zed::set_language_server_installation_status(
                language_server_id,
                &zed::LanguageServerInstallationStatus::Downloading,
            );
            let result = zed::npm_install_package(PACKAGE_NAME, &version);
            match result {
                Ok(()) => {
                    if !self.server_exists() {
                        Err(format!(
                            "installed package '{PACKAGE_NAME}' did not contain expected path '{SERVER_PATH}'",
                        ))?;
                    }
                }
                Err(error) => {
                    if !self.server_exists() {
                        Err(error)?;
                    }
                }
            }
        }

        self.did_find_server = true;
        Ok(SERVER_PATH.to_string())
    }

    pub fn language_server_initialization_options(
        &mut self,
        _language_server_id: &LanguageServerId,
        _worktree: &zed::Worktree,
    ) -> Result<Option<zed::serde_json::Value>> {
        Ok(Some(default_initialization_options()))
    }

    pub fn language_server_workspace_configuration(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<Option<zed::serde_json::Value>> {
        let override_options = LspSettings::for_worktree(language_server_id.as_ref(), worktree)
            .ok()
            .and_then(|lsp_settings| lsp_settings.settings);

        Ok(Some(workspace_configuration(override_options)))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn initialization_options_match_zed_css_adapter() {
        assert_eq!(
            default_initialization_options(),
            zed::serde_json::json!({
                "provideFormatter": true
            })
        );
    }

    #[test]
    fn workspace_configuration_matches_zed_css_adapter() {
        let config = workspace_configuration(Some(zed::serde_json::json!({
            "css": {
                "validate": false
            },
            "scss": {
                "lint": {
                    "unknownProperties": "ignore"
                }
            }
        })));

        assert_eq!(
            config,
            zed::serde_json::json!({
                "css": {
                    "lint": {},
                    "validate": false
                },
                "less": {
                    "lint": {}
                },
                "scss": {
                    "lint": {
                        "unknownProperties": "ignore"
                    }
                }
            })
        );
    }

    #[test]
    fn only_installs_when_the_cached_version_is_older() {
        let latest_version = Version::parse("1.1.0").unwrap();

        assert!(should_install_server(false, Some("1.1.0"), &latest_version));
        assert!(should_install_server(true, None, &latest_version));
        assert!(should_install_server(
            true,
            Some("invalid"),
            &latest_version
        ));
        assert!(should_install_server(true, Some("1.0.0"), &latest_version));
        assert!(!should_install_server(true, Some("1.1.0"), &latest_version));
        assert!(!should_install_server(true, Some("1.2.0"), &latest_version));
    }
}
