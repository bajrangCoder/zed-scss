; Mixin definitions
(mixin_statement
  (name) @name) @item

; Function definitions
(function_statement
  (name) @name) @item

; Placeholder definitions
(placeholder
  (placeholder_selector
    (placeholder_name) @name)) @item

; Rule sets with tag selectors
(rule_set
  (selectors
    (tag_name) @name)) @item

; Rule sets with class selectors
(rule_set
  (selectors
    (class_selector
      (class_name) @name))) @item

; Rule sets with id selectors
(rule_set
  (selectors
    (id_selector
      (id_name) @name))) @item

; Keyframes
(keyframes_statement
  (keyframes_name) @name) @item

; Media queries
(media_statement
  (keyword_query) @name) @item

; @use statements (module imports)
(use_statement
  (string_value) @name) @item

; @import statements
(import_statement
  (string_value) @name) @item

; Variable declarations at root level
(declaration
  (variable_name) @name
  (#match? @name "^\\$")) @item
