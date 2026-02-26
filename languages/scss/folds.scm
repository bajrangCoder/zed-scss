; Rule sets
(rule_set) @fold

; At-rule statements with blocks
[
  (media_statement)
  (supports_statement)
  (keyframes_statement)
  (container_statement)
  (layer_statement)
  (scope_statement)
  (starting_style_statement)
  (view_transition_statement)
  (font_face_statement)
  (counter_style_statement)
  (position_try_statement)
  (font_palette_values_statement)
  (page_statement)
  (font_feature_values_statement)
  (property_statement)
  (at_root_statement)
  (at_rule)
] @fold

; Nested at-rule blocks
(margin_at_rule) @fold
(font_feature_value_block) @fold
(keyframe_block) @fold

; Control flow statements
[
  (if_statement)
  (each_statement)
  (for_statement)
  (while_statement)
] @fold

; Function and mixin definitions
[
  (function_statement)
  (mixin_statement)
] @fold

; Include statements with content blocks
(include_statement) @fold

; Placeholders
(placeholder) @fold

; Multi-line comments
(comment) @fold

; Sassdoc blocks
(sassdoc_block) @fold

; Map values (useful for large config maps)
(map_value) @fold

; Consecutive import/use/forward statements
(import_statement)+ @fold
(use_statement)+ @fold
(forward_statement)+ @fold
