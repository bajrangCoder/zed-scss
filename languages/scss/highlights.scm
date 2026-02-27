[
  (comment)
  (single_line_comment)
] @comment

(sassdoc_block) @comment.doc

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
; false matches inside identifiers (e.g. "not" in "annotation")
[
  (binary_query "and")
  (binary_query "or")
  (unary_query "not")
  (unary_query "only")
  (style_query "and")
  (style_query "or")
  (style_query "not")
  (scroll_state_query "and")
  (scroll_state_query "or")
  (scroll_state_query "not")
  (if_style_condition "and")
  (if_style_condition "or")
  (if_style_condition "not")
  (binary_expression "and")
  (binary_expression "or")
  (unary_expression "not")
] @keyword.operator

(pseudo_element_selector "::" (tag_name) @selector.pseudo)
(pseudo_class_selector ":" (class_name) @selector.pseudo)
(page_pseudo_class) @selector.pseudo

[
  (variable_name)
  (variable_value)
  (container_statement (container_name))
] @variable.other.member

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
; false matches inside identifiers (e.g. "as" in "ease-out")
[
  (as_clause "as")
  (with_clause "with")
  (visibility_clause "hide")
  (visibility_clause "show")
] @keyword

[
  (selector_query "selector")
  (style_query "style")
  (scroll_state_query "scroll-state")
  (font_tech_query "font-tech")
  (font_format_query "font-format")
  (at_rule_query "at-rule")
  (named_feature_query "named-feature")
  (import_layer "layer")
  (import_supports "supports")
  (if_style_condition "style")
  (if_media_condition "media")
  (if_supports_condition "supports")
  (if_sass_condition "sass")
] @function.builtin

[
  (if_expression (function_name))
  (attr_expression (function_name))
  (attr_type_function (function_name))
] @function.builtin

(attr_type (keyword) @keyword)
(syntax_type) @type
(if_else_condition) @keyword.control.conditional

(style_condition
  (property_name) @property)

(scroll_state_condition
  (state_name) @property
  (state_value) @constant.builtin)

[
  "@function"
  "@mixin"
] @keyword.function

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

; Custom properties (CSS variables) as @variable
((property_name) @variable
  (#match? @variable "^[-][-]"))

((plain_value) @variable
  (#match? @variable "^[-][-]"))

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
