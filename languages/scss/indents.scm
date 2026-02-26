; CSS base indentation
[
  (block)
  (declaration)
] @indent.begin

(block
  "}" @indent.branch)

"}" @indent.dedent

(comment) @indent.ignore

; SCSS-specific indentation
[
  (mixin_statement)
  (function_statement)
  (if_clause)
  (else_if_clause)
  (else_clause)
  (each_statement)
  (for_statement)
  (while_statement)
  (include_statement)
  (placeholder)
] @indent.begin
