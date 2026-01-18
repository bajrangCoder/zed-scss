; Functions (af, if, ]m, [m, etc.)
(function_statement
  (block (_)* @function.inside)) @function.around

(function_statement) @function.around

; Mixins treated as functions
(mixin_statement
  (block (_)* @function.inside)) @function.around

(mixin_statement) @function.around

; Classes - Rule sets act as "classes" in CSS/Sass
(rule_set
  (block (_)* @class.inside)) @class.around

(rule_set) @class.around

; Placeholders as classes
(placeholder
  (block (_)* @class.inside)) @class.around

(placeholder) @class.around

; Media queries as classes
(media_statement
  (block (_)* @class.inside)) @class.around

(media_statement) @class.around

; Keyframes as classes
(keyframes_statement
  (block (_)* @class.inside)) @class.around

(keyframes_statement) @class.around

; Comments - join adjacent comments
(comment)+ @comment.around
(single_line_comment)+ @comment.around
