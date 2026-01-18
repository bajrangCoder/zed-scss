; Block-opening statements that should increase indent
(rule_set) @indent
(mixin_statement) @indent
(function_statement) @indent
(if_clause) @indent
(else_if_clause) @indent
(else_clause) @indent
(each_statement) @indent
(for_statement) @indent
(while_statement) @indent
(media_statement) @indent
(supports_statement) @indent
(keyframes_statement) @indent
(at_root_statement) @indent
(placeholder) @indent
(keyframe_block) @indent

; Property declarations with nested blocks
(declaration
  (property_name)
  (block)) @indent

; Decrease indent at block end
(block) @outdent
