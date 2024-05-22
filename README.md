# zed-scss

SCSS language support for [Zed](https://zed.dev).

## Features

- Syntax Highlighting
- Completion(uses vscode-css-language-server for completion)

## Grammar

- [tree-sitter-scss](https://github.com/tree-sitter-grammars/tree-sitter-scss)

## Feedback

Provide your feedback to improve this extension.

## Known Issues

- Unable to parse (`#{}` and `@include`):

  1.

  ```scss
  color: $color; // Correct formatting
  color: #{$color}; // Breaks formatting
  color: $color; // Incorrect formatting
  ```

  2.

  ```scss
  body {
    @include fonts.noto-serif-display-400;
    margin: 0;
    background-color: #ffffff;
    color: var(--c-dark);
    height: 100%;
  }
  ```
