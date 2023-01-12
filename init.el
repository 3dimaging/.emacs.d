
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;;(require 'cask "~/.cask/cask.el")
;;(cask-initialize)    ; 类似于 package-initialize
;;(require 'pallet)
;;(pallet-mode t)      ; 激活 pallet, 在安装包时将 Cask
;;(require 'use-package)
;;(require 'ob-tangle)
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp")
;;(require 'use-package)
;; (setq scimax-dir "~/scimax")
;; (add-to-list 'load-path "~/scimax")
;; (require 'ob-ipython)
;;(require 'scimax-org-babel-ipython-upstream)
;;(require 'scimax-org)


(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")
    )

(global-set-key (kbd "C-x e") 'open-my-init-file)


;;(require 'smex) ; Not needed if you use package.el
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)
;;  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)


(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'yasnippet)
(require 'init-keybindings)
(require 'init-python)
(require 'init-evil)
(require 'init-javascript)
(require 'init-latex)
(require 'init-org)
(require 'init-edit)
(require 'init-company)
(require 'init-helm)
;; (require 'init-cpp)

