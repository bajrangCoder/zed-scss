; Comments
(comment) @comment
(single_line_comment) @comment

; Keywords
[
  "@import"
  "@use"
  "@forward"
  "@media"
  "@charset"
  "@namespace"
  "@keyframes"
  "@supports"
  "@font-face"
  "@mixin"
  "@include"
  "@extend"
  "@if"
  "@else"
  "@each"
  "@for"
  "@while"
  "@function"
  "@return"
  "@at-root"
  "@error"
  "@warn"
  "@debug"
  "@content"
] @keyword

(at_keyword) @keyword

; Shorthand keywords
(shorthand_mixin) @keyword
(shorthand_include) @keyword

; Control flow keywords
[
  "from"
  "through"
  "to"
  "in"
  "and"
  "or"
  "not"
  "only"
] @keyword

; Module keywords
[
  "as"
  "with"
  "using"
  "hide"
  "show"
] @keyword

; Boolean and null literals
(boolean_value) @constant
(null_value) @constant

; CSS Custom Properties
(custom_property_name) @property

; Important/default/global flags
(important) @keyword
(default) @keyword
(global) @keyword
(optional_flag) @keyword

; Numbers
(integer_value) @number
(float_value) @number

; Colors
(color_value) @string.special

; Strings
(string_value) @string
(escape_sequence) @string.escape
(unicode_escape) @string.escape

; Variables
(variable_name) @variable
(variable_value) @variable
(variable_identifier) @variable

; Properties
(property_name) @property

; Functions
(function_name) @function
(function_statement
  (name) @function)
(mixin_statement
  (name) @function)
(mixin_name) @function
(call_expression
  (function_name) @function)

; Built-in functions
(color_function
  (function_name) @function.builtin)
(gradient_function
  (function_name) @function.builtin)
(math_function
  (function_name) @function.builtin)
(var_function
  (function_name) @function.builtin)

; Selectors
(tag_name) @tag
(class_name) @type
(id_name) @type
(placeholder_name) @type
(nesting_selector) @punctuation.special
(universal_selector) @tag

; Pseudo-classes and pseudo-elements
(pseudo_class_selector
  (class_name) @type)
(pseudo_element_selector
  (element_name) @type)

; Attribute selectors
(attribute_name) @attribute
(attribute_selector
  [
    "="
    "~="
    "^="
    "|="
    "*="
    "$="
  ] @operator)

; Namespace
(namespace_name) @type
(module) @type

; Interpolation
(interpolation
  "#{" @punctuation.special
  "}" @punctuation.special)

; Operators
[
  "*"
  "/"
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
  "+"
  "-"
] @operator

; Punctuation
[
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

[
  ":"
  "::"
  ","
  "."
  "~"
  "|"
] @punctuation.delimiter

; Spread operator
"..." @punctuation.special

; Media queries
(keyword_query) @keyword

; Keyframes
(keyframes_name) @string.special
