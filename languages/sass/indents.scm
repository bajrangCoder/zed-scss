; Sass Indentation Queries
; =========================

; Increase indent after block-opening statements
(rule_set) @indent.begin
(mixin_statement) @indent.begin
(function_statement) @indent.begin
(if_clause) @indent.begin
(else_if_clause) @indent.begin
(else_clause) @indent.begin
(each_statement) @indent.begin
(for_statement) @indent.begin
(while_statement) @indent.begin
(media_statement) @indent.begin
(supports_statement) @indent.begin
(keyframes_statement) @indent.begin
(at_root_statement) @indent.begin
(include_statement) @indent.begin
(placeholder) @indent.begin

; Block ends decrease indent
(block) @indent.end

; Property declarations with nested blocks
(declaration
  (property_name)
  (block)) @indent.begin
