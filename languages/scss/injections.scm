; Inject sassdoc into documentation blocks
; sassdoc_block groups consecutive /// comments
((sassdoc_block) @injection.content
  (#set! injection.language "sassdoc"))
