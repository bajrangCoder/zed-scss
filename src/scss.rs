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
}
zed::register_extension!(SCSSExtension);

/// Extensions to the Zed extension API that have not yet stabilized.
mod zed_ext {
    /// Sanitizes the given path to remove the leading `/` on Windows.
    ///
    /// On macOS and Linux this is a no-op.
    ///
    /// This is a workaround for https://github.com/bytecodealliance/wasmtime/issues/10415.
    pub fn sanitize_windows_path(path: std::path::PathBuf) -> std::path::PathBuf {
        use zed_extension_api::{current_platform, Os};

        let (os, _arch) = current_platform();
        match os {
            Os::Mac | Os::Linux => path,
            Os::Windows => path
                .to_string_lossy()
                .to_string()
                .trim_start_matches('/')
                .into(),
        }
    }
}
