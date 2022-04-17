# show-eof-mode

Minor mode to show `[EOF]` marker.

![screenshot](screenshot.png)

## Usage

Just load and enable `show-eof-mode`. Setting hooks may be useful.

```emacs-lisp
(require 'show-eof-mode)
(add-hook 'prog-mode-hook 'show-eof-mode)
(add-hook 'text-mode-hook 'show-eof-mode)
```

## Customization

- `show-eof-marker-string` ... string to mark EOF (default: `[EOF]`)
- `show-eof-marker-face` ... face to fontify EOF markers
