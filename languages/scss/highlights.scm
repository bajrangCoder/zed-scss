[
  (comment)
  (single_line_comment)
] @comment

(sassdoc_block) @comment.doc

(tag_name) @tag

[
  (universal_selector)
  (nesting_selector)
] @character.special

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

(pseudo_element_selector "::" (tag_name) @attribute)
(pseudo_class_selector ":" (class_name) @attribute)
(page_pseudo_class) @attribute

[
  (variable_name)
  (variable_value)
] @variable

(container_statement (container_name) @variable)

(argument_name) @variable.parameter

[
  (feature_name)
  (identifier)
  (property_name)
] @property

(id_name) @constant
(class_name) @type
(placeholder_name) @type
(namespace_name) @module
(namespace_selector (tag_name) @module "|")
(variable_module (module) @module)
(call_expression module: (module) @module)

(attribute_name) @tag.attribute

[
  (function_name)
  (mixin_name)
] @function

(function_statement (name) @function)
(mixin_statement (name) @function)

[
  (plain_value)
  (keyword_query)
  (feature_value)
] @constant.builtin

(keyframes_name) @variable

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
  "@warn"
  (at_keyword)
  (margin_at_keyword)
  (font_feature_value_keyword)
] @keyword.directive

[
  (to)
  (from)
] @keyword

[
  (important)
  (default)
  (global)
] @keyword.modifier

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
(if_else_condition) @keyword.conditional

(style_condition
  (property_name) @property)

(scroll_state_condition
  (state_name) @property
  (state_value) @constant.builtin)

[
  "@function"
  "@mixin"
] @keyword.function

"@return" @keyword.return

[
  "@else"
  "@if"
] @keyword.conditional
(else_if_clause "if" @keyword.conditional)

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
] @keyword.import

; Custom properties (CSS variables) as @variable
((property_name) @variable
  (#lua-match? @variable "^[-][-]"))

((plain_value) @variable
  (#lua-match? @variable "^[-][-]"))

(string_value) @string
(color_value) @string.special

(integer_value) @number
(float_value) @number.float
(unit) @type

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
