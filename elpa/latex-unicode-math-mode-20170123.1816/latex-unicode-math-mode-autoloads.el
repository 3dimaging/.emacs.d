;;; latex-unicode-math-mode-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "latex-unicode-math-mode" "latex-unicode-math-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from latex-unicode-math-mode.el

(autoload 'latex-unicode-math-mode "latex-unicode-math-mode" "\
Dynamically enable the Unicode math input method in LaTeX math mode.

This is a minor mode.  If called interactively, toggle the
`Latex-Unicode-Math mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `latex-unicode-math-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(autoload 'latex-unicode-mode "latex-unicode-math-mode" "\
Enable the Unicode math input method everywhere in the buffer.

This is a minor mode.  If called interactively, toggle the
`Latex-Unicode mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `latex-unicode-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "latex-unicode-math-mode" '("latex-unicode-"))

;;;***

;;;### (autoloads nil nil ("latex-unicode-math-mode-pkg.el") (0 0
;;;;;;  0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; latex-unicode-math-mode-autoloads.el ends here
