; Parentheses (function calls, arguments, conditions)
("(" @open ")" @close)

; Square brackets (attribute selectors, lists)
("[" @open "]" @close)

; Interpolation brackets
("#{" @open "}" @close)

; String quotes - exclude from rainbow coloring
(
  (string_value) @open @close
  (#set! rainbow.exclude)
)
