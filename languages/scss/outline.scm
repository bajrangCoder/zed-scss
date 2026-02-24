(stylesheet
    (import_statement
        "@import" @context
        ((_) @name)
    ) @item
)

(rule_set
    (selectors
      .
      (_) @name
      ("," @name (_) @name)*
    )
    (block)
) @item

; (declaration
;   (variable_name) @name
; ) @item

(media_statement
    "@media" @context
    (_) @name
    (block)
) @item

(container_statement
    "@container" @context
    (container_name)? @name
    (_) @context.extra
    (block)
) @item

(layer_statement
    "@layer" @context
    (layer_name)? @name
    (block)
) @item

(mixin_statement
    "@mixin" @context
    (name) @name
    (_) @context.extra
    (block)
) @item

(function_statement
    "@function" @context
    (name) @name
    (parameters) @context.extra
) @item

(each_statement
    "@each" @context
    (value) @name
    "in" @context.extra
    (_) @context.extra
    (block)
) @item

(for_statement
    "@for" @context
    (variable_name) @name
    "from" @context.extra
    (_) @context.extra
    "through" @context.extra
    (_) @context.extra
    (block)
) @item

(while_statement
    "@while" @name
    (_) @context.extra
    (block)
) @item

(use_statement
    "@use" @context
    (_) @name
) @item

(forward_statement
    "@forward" @context
    (_) @name
) @item

(if_clause
  "@if" @context
  (condition) @name
  (block)
) @item

(else_if_clause
    "@else" @context
    "if" @context.extra
    (condition) @name
    (block)
) @item

(else_clause
    "@else" @name
    (block)
) @item

(keyframes_statement
    "@keyframes" @context
    (keyframes_name) @name
) @item

(placeholder
    (placeholder_selector
      "%" @context
      (placeholder_name) @name
    )
    (block)
) @item

(counter_style_statement
    "@counter-style" @context
    (name) @name
    (block)
) @item

(position_try_statement
    "@position-try" @context
    (name) @name
    (block)
) @item

(font_palette_values_statement
    "@font-palette-values" @context
    (name) @name
    (block)
) @item

(font_feature_values_statement
    "@font-feature-values" @context
    (font_family) @name
) @item

(comment) @annotation
