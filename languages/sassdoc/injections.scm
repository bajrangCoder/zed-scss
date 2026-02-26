; Inject language into @example code blocks based on example_language
; The language name (scss, css, html, javascript, etc.) is used directly
; Using injection.combined to merge code_lines into one parse
((tag_example
  (example_language) @injection.language
  (code_block
    (code_line) @injection.content))
  (#set! injection.combined))
