; Inject comment parser for TODO/FIXME/NOTE highlighting
((comment) @injection.content
  (#set! injection.language "comment"))

((single_line_comment) @injection.content
  (#set! injection.language "comment"))

; Inject sassdoc into documentation blocks
((sassdoc_block) @injection.content
  (#set! injection.language "sassdoc"))
