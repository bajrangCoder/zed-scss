(stylesheet
    (import_statement
        "@import" @context
        ((string_value) @name)) @item)


(rule_set
    (selectors
      .
      (_) @name
      ("," @name (_) @name)*
    )) @item

(media_statement
    "@media" @context
    (_) @name
    (block)
) @item

(mixin_statement
    "@mixin" @context
    (_) @name
    (parameters) @item
    (block) @item
) @item

(function_statement
    "@function" @context
    (identifier) @name
    (parameters) @context.extra
) @item

(each_statement
    "@each" @context
    (_) @name
    "in" @context.extra
    (variable) @context.extra
) @item


(for_statement
    "@for" @context
    (variable) @name
    "from" @context.extra
    (integer_value) @context.extra
    "through" @context.extra
    (integer_value) @context.extra
) @item

(while_statement
    "@while" @context
    (binary_expression) @name
) @item

(comment) @annotation
