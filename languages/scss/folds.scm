; Fold blocks with braces
(block) @fold

; Fold rule sets
(rule_set) @fold

; Fold at-rule statements with blocks
(media_statement) @fold
(supports_statement) @fold
(keyframes_statement) @fold
(container_statement) @fold
(layer_statement) @fold
(scope_statement) @fold
(starting_style_statement) @fold
(view_transition_statement) @fold
(font_face_statement) @fold
(counter_style_statement) @fold
(position_try_statement) @fold
(font_palette_values_statement) @fold
(page_statement) @fold
(font_feature_values_statement) @fold

; Fold control flow statements
(if_statement) @fold
(each_statement) @fold
(for_statement) @fold
(while_statement) @fold

; Fold function and mixin definitions
(function_statement) @fold
(mixin_statement) @fold

; Fold placeholders
(placeholder) @fold

; Fold multi-line comments
(comment) @fold

; Fold sassdoc blocks
(sassdoc_block) @fold

; Fold map values (useful for large config maps)
(map_value) @fold
