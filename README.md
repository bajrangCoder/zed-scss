# zed-scss

SCSS language support for [Zed](https://zed.dev).

## Grammar

- [tree-sitter-scss](https://github.com/tree-sitter-grammars/tree-sitter-scss)

## Feedback

Provide your feedback to improve this extension.

## Known Issues

- Unable to parse (`#{}` and `@mixin`):

  1.

  ```scss
  color: $color; // Correct formatting
  color: #{$color}; // Breaks formatting
  color: $color; // Incorrect formatting
  ```

  2.

  ```scss
  body {
    @mixin body_long_14;
    margin: 0;
    background-color: #ffffff;
    color: var(--c-dark);
    height: 100%;
  }
  ```
