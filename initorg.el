
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)    ; 类似于 package-initialize
(require 'pallet)
(pallet-mode t)  

;;(require 'org-install)
;;(require 'ob-tangle)



(require 'org)
;; Open the configuration
(find-file (concat user-emacs-directory "myemacs.org"))
;; tangle it
(org-babel-tangle)
(org-babel-load-file (expand-file-name "~/.emacs.d/myemacs.org"))
;; load it
;;(load-file (concat user-emacs-directory "init.el"))
;; finally byte-compile it
;;(byte-compile-file (concat user-emacs-directory "init.el"))
;;(add-to-list 'load-path "~/.emacs.d/lisp")

