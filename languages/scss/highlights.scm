[(comment) (single_line_comment)] @comment

[
  (tag_name)
  (universal_selector)
] @tag
(attribute_selector (plain_value) @string)
(nesting_selector) @variable.other.member

[
  "~"
  ">"
  "+"
  "-"
  "*"
  "/"
  "="
  "^="
  "|="
  "~="
  "$="
  "*="
  "and"
  "or"
  "not"
  "only"
  ">="
  "<="
] @operator

(attribute_selector (plain_value) @string)
(pseudo_element_selector (tag_name) @attribute)
(pseudo_class_selector (class_name) @attribute)

(variable_name) @variable.other.member
(variable_value) @variable.other.member
(argument_name) @variable.parameter

[
  (class_name)
  (id_name)
  (namespace_name)
  (feature_name)
  (identifier)
  (property_name)
] @property

(attribute_name) @attribute

(function_name) @function

(
  [
    (property_name)
    (plain_value)
  ] @variable.special
  (#match? @variable.special "^--")
)

[
    "@at-root"
    "@charset"
    "@debug"
    "@error"
    "@extend"
    "@keyframes"
    "@media"
    "@mixin"
    "@supports"
    "@warn"
] @constant.builtin

"@function" @function.method

"@namespace" @namespace

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

[
  (at_keyword)
  (to)
  (from)
  (important)
]  @keyword

(string_value) @string
(color_value) @string.special

[
  (integer_value)
  (float_value)
] @number
(unit) @type

(boolean_value) @boolean
(null_value) @constant.builtin

[
  ","
  ":"
  "."
  "::"
  ";"
  "#"
] @punctuation.delimiter

[
  "{"
  ")"
  "("
  "}"
  "["
  "]"
] @punctuation.bracket
