;;; indent-tools-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "indent-tools" "indent-tools.el" (0 0 0 0))
;;; Generated autoloads from indent-tools.el

(autoload 'indent-tools-minor-mode "indent-tools" "\
Navigate, indent and act on blocks delemited by their indentation level.

This is a minor mode.  If called interactively, toggle the
`Indent-Tools minor mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `indent-tools-minor-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\\{indent-tools-mode-map}

\(fn &optional ARG)" t nil)

(register-definition-prefixes "indent-tools" '("hydra-indent-tools" "indent-tools-"))

;;;***

;;;### (autoloads nil "indent-tools-indentation-of" "indent-tools-indentation-of.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from indent-tools-indentation-of.el

(register-definition-prefixes "indent-tools-indentation-of" '("indent-tools-indentation-of"))

;;;***

;;;### (autoloads nil nil ("indent-tools-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; indent-tools-autoloads.el ends here
