[
  (comment)
  (single_line_comment)
  (sassdoc_block)
] @comment

[
  (tag_name)
  (universal_selector)
  (nesting_selector)
] @tag

(attribute_selector (plain_value) @string)
(parenthesized_query
  (keyword_query) @property)

[
  "~"
  ">"
  "<"
  "+"
  "-"
  "*"
  "/"
  "%"
  "="
  "=="
  "!="
  "^="
  "|"
  "|="
  "~="
  "$="
  "*="
  ">="
  "<="
  (range_operator)
] @operator

; Scope keyword operators to their parent nodes to avoid
; false matches inside identifiers (e.g. "not" in "annotation").
; The capture must be placed on the string node itself (inside the
; parentheses) to avoid highlighting the entire parent expression.
[
  (binary_query "and" @keyword.operator)
  (binary_query "or" @keyword.operator)
  (unary_query "not" @keyword.operator)
  (unary_query "only" @keyword.operator)
  (style_query "and" @keyword.operator)
  (style_query "or" @keyword.operator)
  (style_query "not" @keyword.operator)
  (scroll_state_query "and" @keyword.operator)
  (scroll_state_query "or" @keyword.operator)
  (scroll_state_query "not" @keyword.operator)
  (if_style_condition "and" @keyword.operator)
  (if_style_condition "or" @keyword.operator)
  (if_style_condition "not" @keyword.operator)
  (binary_expression "and" @keyword.operator)
  (binary_expression "or" @keyword.operator)
  (unary_expression "not" @keyword.operator)
]

(pseudo_element_selector "::" (tag_name) @selector.pseudo)
(pseudo_class_selector ":" (class_name) @selector.pseudo)
(page_pseudo_class) @selector.pseudo

[
  (variable_name)
  (variable_value)
] @variable.other.member

(container_statement (container_name) @variable.other.member)

(argument_name) @variable.parameter

[
  (feature_name)
  (identifier)
  (property_name)
] @property

(id_name) @selector.id
(class_name) @selector.class
(placeholder_name) @selector.class
(namespace_name) @namespace
(namespace_selector (tag_name) @namespace "|")
(variable_module (module) @namespace)
(call_expression module: (module) @namespace)

(attribute_name) @attribute

[
  (function_name)
  (mixin_name)
] @function

(function_statement (name) @function)
(mixin_statement (name) @function)

[
  (plain_value)
  (keyframes_name)
  (keyword_query)
  (feature_value)
] @constant.builtin

(interpolation "#{" @punctuation.special "}" @punctuation.special)

[
  "@media"
  "@charset"
  "@namespace"
  "@supports"
  "@keyframes"
  "@container"
  "@layer"
  "@scope"
  "@property"
  "@starting-style"
  "@view-transition"
  "@font-face"
  "@counter-style"
  "@position-try"
  "@font-palette-values"
  "@page"
  "@font-feature-values"
  "@at-root"
  "@debug"
  "@error"
  "@extend"
  "@mixin"
  "@warn"
  (at_keyword)
  (to)
  (from)
  (important)
  (default)
  (global)
  (margin_at_keyword)
  (font_feature_value_keyword)
] @keyword

; Scope bare keyword strings to their parent nodes to avoid
; false matches inside identifiers (e.g. "as" in "ease-out").
; The capture must be placed on the string node itself (inside the
; parentheses) to avoid highlighting the entire parent clause.
[
  (as_clause "as" @keyword)
  (with_clause "with" @keyword)
  (visibility_clause "hide" @keyword)
  (visibility_clause "show" @keyword)
]

[
  (selector_query "selector" @function.builtin)
  (style_query "style" @function.builtin)
  (scroll_state_query "scroll-state" @function.builtin)
  (font_tech_query "font-tech" @function.builtin)
  (font_format_query "font-format" @function.builtin)
  (at_rule_query "at-rule" @function.builtin)
  (named_feature_query "named-feature" @function.builtin)
  (import_layer "layer" @function.builtin)
  (import_supports "supports" @function.builtin)
  (if_style_condition "style" @function.builtin)
  (if_media_condition "media" @function.builtin)
  (if_supports_condition "supports" @function.builtin)
  (if_sass_condition "sass" @function.builtin)
]

[
  (if_expression (function_name) @function.builtin)
  (attr_expression (function_name) @function.builtin)
  (attr_type_function (function_name) @function.builtin)
]

(attr_type (keyword) @keyword)
(syntax_type) @type
(if_else_condition) @keyword.control.conditional

(style_condition
  (property_name) @property)

(scroll_state_condition
  (state_name) @property
  (state_value) @constant.builtin)

"@function" @keyword.function

"@return" @keyword.control.return

[
  "@else"
  "@if"
] @keyword.control.conditional
(else_if_clause "if" @keyword.control.conditional)

; Scope loop keywords to their parent nodes
[
  "@while"
  "@each"
  "@for"
] @keyword.repeat
(for_statement "through" @keyword.repeat)
(for_statement "from" @keyword.repeat)
(each_statement "in" @keyword.repeat)

[
  "@forward"
  "@import"
  "@include"
  "@use"
] @keyword.control.import

(string_value) @string
(color_value) @string.special

[
  (integer_value)
  (float_value)
] @number
(unit) @type.unit

(boolean_value) @boolean
(null_value) @constant.builtin

[
  ","
  ":"
  "."
  "::"
  ";"
] @punctuation.delimiter
(id_selector "#" @punctuation.delimiter)

[
  "{"
  ")"
  "("
  "}"
  "["
  "]"
] @punctuation.bracket
