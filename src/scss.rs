mod language_servers;

use zed_extension_api::{self as zed, LanguageServerId, Result};

use crate::language_servers::{SCSSLsp, SomeSass};

struct SCSSExtension {
    scss_lsp: Option<SCSSLsp>,
    some_sass: Option<SomeSass>,
}

impl zed::Extension for SCSSExtension {
    fn new() -> Self {
        Self {
            scss_lsp: None,
            some_sass: None,
        }
    }

    fn language_server_command(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        match language_server_id.as_ref() {
            SCSSLsp::LANGUAGE_SERVER_ID => {
                let intelephense = self.scss_lsp.get_or_insert_with(|| SCSSLsp::new());
                intelephense.language_server_command(language_server_id, worktree)
            }
            SomeSass::LANGUAGE_SERVER_ID => {
                let some_sass = self.some_sass.get_or_insert_with(|| SomeSass::new());
                some_sass.language_server_command(language_server_id, worktree)
            }
            language_server_id => Err(format!("unknown language server: {language_server_id}")),
        }
    }

    fn language_server_initialization_options(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<Option<zed::serde_json::Value>> {
        match language_server_id.as_ref() {
            SomeSass::LANGUAGE_SERVER_ID => {
                let some_sass = self.some_sass.get_or_insert_with(|| SomeSass::new());
                some_sass.language_server_initialization_options(language_server_id, worktree)
            }
            SCSSLsp::LANGUAGE_SERVER_ID => {
                let scss_lsp = self.scss_lsp.get_or_insert_with(|| SCSSLsp::new());
                scss_lsp.language_server_initialization_options(language_server_id, worktree)
            }
            _ => Ok(None),
        }
    }

    fn language_server_workspace_configuration(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<Option<zed::serde_json::Value>> {
        match language_server_id.as_ref() {
            SomeSass::LANGUAGE_SERVER_ID => {
                let some_sass = self.some_sass.get_or_insert_with(|| SomeSass::new());
                some_sass.language_server_workspace_configuration(language_server_id, worktree)
            }
            SCSSLsp::LANGUAGE_SERVER_ID => {
                let scss_lsp = self.scss_lsp.get_or_insert_with(|| SCSSLsp::new());
                scss_lsp.language_server_workspace_configuration(language_server_id, worktree)
            }
            _ => Ok(None),
        }
    }
}
zed::register_extension!(SCSSExtension);
