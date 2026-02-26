; Fold code blocks in @example tags
(tag_example
  (code_block) @fold)

; Fold entire example tags (when they have code)
(tag_example
  (code_block)) @fold
