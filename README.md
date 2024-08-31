# zed-scss

SCSS support for [Zed](https://zed.dev).

## Features

- Syntax Highlighting
- Outline View
- IntelliSense(uses vscode-css-language-server and [some-sass](https://github.com/wkillerud/some-sass/))
- Formatting

## Grammar

- [tree-sitter-scss](https://github.com/tree-sitter-grammars/tree-sitter-scss)

## Feedback

Provide your feedback to improve this extension.

## Known Issues

- Unable to parse (`#{}` and `@include`) but works in some cases:

  1.

  ```scss
  color: $color; // Correct formatting
  color: #{$color}; // Breaks formatting
  color: $color; // Incorrect formatting
  ```

  2.

  ```scss
  li {
    display: inline-block;
    margin: {
        left: -2px;
        right: 2em;
    }
  }
  ```

## Contributers

<a href="https://github.com/bajrangCoder/zed-scss/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=bajrangCoder/zed-scss" />
</a>

## License

MIT
