use zed_extension_api::{self as zed, settings::LspSettings, LanguageServerId};

pub fn merge_json_value(target: &mut zed::serde_json::Value, source: zed::serde_json::Value) {
    match (target, source) {
        (zed::serde_json::Value::Object(target), zed::serde_json::Value::Object(source)) => {
            for (key, value) in source {
                merge_json_value(
                    target.entry(key).or_insert(zed::serde_json::Value::Null),
                    value,
                );
            }
        }
        (target, source) => *target = source,
    }
}

pub fn settings_from_worktree(
    language_server_id: &LanguageServerId,
    worktree: &zed::Worktree,
) -> Option<zed::serde_json::Value> {
    LspSettings::for_worktree(language_server_id.as_ref(), worktree)
        .ok()
        .and_then(|lsp_settings| {
            lsp_settings.settings.or_else(|| {
                lsp_settings
                    .initialization_options
                    .and_then(|opts| opts.get("settings").cloned())
            })
        })
}
