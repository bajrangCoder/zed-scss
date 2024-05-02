[
  "@at-root"
  "@debug"
  "@error"
  "@extend"
  "@forward"
  "@mixin"
  "@use"
  "@warn"
] @keyword

"@function" @keyword.function

"@return" @keyword.return

"@include" @keyword.import

"@import" @keyword.import

"@keyframes" @keyword.import

[
  "@while"
  "@each"
  "@for"
  "from"
  "through"
  "in"
] @keyword.repeat

(js_comment) @comment

(comment) @comment

(function_name) @function

[
  ">="
  "<="
] @operator

(mixin_statement
  name: (identifier) @function)

(mixin_statement
  (parameters
    (parameter) @variable.parameter))

(function_statement
  name: (identifier) @function)

(function_statement
  (parameters
    (parameter) @variable.parameter))

(class_selector
    "." @variable)

(keyword_query) @function

(identifier) @variable

(variable) @variable

(argument) @variable.parameter

(arguments) @variable.parameter

(property_name) @property

(pseudo_class_selector) @tag

(pseudo_class_selector
    ":" @variable)

(pseudo_element_selector) @tag

(pseudo_element_selector
    "::" @variable)

(unit) @attribute

(important) @keyword

(color_value) @string.special

(integer_value) @constant

(media_statement) @function

(attribute_selector) @property

(id_selector) @tag

(id_selector
    "#" @variable)

(class_selector) @tag

(tag_name) @tag

(string_value) @string

(universal_selector) @punctuation

(include_statement
  (identifier) @function)
