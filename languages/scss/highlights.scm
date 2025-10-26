[(comment) (single_line_comment)] @comment

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
  "+"
  "-"
  "*"
  "/"
  "="
  "^="
  "|"
  "|="
  "~="
  "$="
  "*="
  ">="
  "<="
] @operator

[
  "and"
  "or"
  "not"
  "only"
] @keyword.operator

(attribute_selector (plain_value) @string)
(pseudo_element_selector "::" (tag_name) @selector.pseudo)
(pseudo_class_selector ":" (class_name) @selector.pseudo)

(variable_name) @variable.other.member
(variable_value) @variable.other.member
(argument_name) @variable.parameter

[
  (feature_name)
  (identifier)
  (property_name)
] @property

(id_name) @selector.id
(class_name) @selector.class
(namespace_name) @namespace
(namespace_selector (tag_name) @namespace "|")

(attribute_name) @attribute

(function_name) @function

[
  (plain_value)
  (keyframes_name)
  (keyword_query)
] @constant.builtin

(
  [
    (property_name)
    (plain_value)
  ] @variable
  (#match? @variable "^--")
)

[
  "@media"
  "@import"
  "@charset"
  "@namespace"
  "@supports"
  "@keyframes"
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
] @keyword

"@function" @function.method

"@return" @keyword.control.return

[
    "@else"
    "@if"
] @keyword.control.conditional

[
  "@while"
  "@each"
  "@for"
  "through"
  "in"
  "from"
  "if"
] @keyword.repeat

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
