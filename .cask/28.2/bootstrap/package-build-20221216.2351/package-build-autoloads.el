;;; package-build-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "package-build" "package-build.el" (0 0 0 0))
;;; Generated autoloads from package-build.el

(autoload 'package-build-archive "package-build" "\
Build a package archive for the package named NAME.
If DUMP-ARCHIVE-CONTENTS is non-nil, the updated archive contents
are subsequently dumped.

\(fn NAME &optional DUMP-ARCHIVE-CONTENTS)" t nil)

(autoload 'package-build--package "package-build" "\
Build the package version specified by RCP.
Return the archive entry for the package and store the package
in `package-build-archive-dir'.

\(fn RCP)" nil nil)

(autoload 'package-build-all "package-build" "\
Build a package for each of the available recipes.
If `package-build-predicate-function' is non-nil, then only
packages for which that returns non-nil are build." t nil)

(register-definition-prefixes "package-build" '("package-build-"))

;;;***

;;;### (autoloads nil "package-build-badges" "package-build-badges.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from package-build-badges.el

(register-definition-prefixes "package-build-badges" '("package-build--write-melpa-badge-image"))

;;;***

;;;### (autoloads nil "package-recipe" "package-recipe.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from package-recipe.el

(register-definition-prefixes "package-recipe" '("package-"))

;;;***

;;;### (autoloads nil "package-recipe-mode" "package-recipe-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from package-recipe-mode.el

(autoload 'package-build-create-recipe "package-recipe-mode" "\
Create a new recipe for the package named NAME using FETCHER.

\(fn NAME FETCHER)" t nil)

(autoload 'package-build-current-recipe "package-recipe-mode" "\
Build archive for the recipe defined in the current buffer." t nil)

(register-definition-prefixes "package-recipe-mode" '("package-build-minor-mode"))

;;;***

;;;### (autoloads nil nil ("package-build-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; package-build-autoloads.el ends here
