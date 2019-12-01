
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)    ; 类似于 package-initialize
(require 'pallet)
(pallet-mode t)      ; 激活 pallet, 在安装包时将 Cask 


;;(require 'ob-tangle)
(add-to-list 'load-path "~/.emacs.d/lisp")
;; (setq scimax-dir "~/scimax")
;; (add-to-list 'load-path "~/scimax")
;; (require 'ob-ipython)
;;(require 'scimax-org-babel-ipython-upstream)
;;(require 'scimax-org)


(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")
    )




;;(require 'smex) ; Not needed if you use package.el
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)
;;  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;(require 'dired+)

;;(require 'hungry-delete)
;;(global-hungry-delete-mode t)

;;(global-flycheck-mode t)
;;(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(which-key-mode 1)

;; ;;(electric-indent-mode 1)

;; ;;(setq exec-path-from-shell-variables '("PATH" "MANPATH" "GOROOT"))


(require 'dired-imenu)

;; A quick major mode help with discover-my-major; The setup binds C-h h m to discover-my-major.
(global-unset-key (kbd "C-h h"))        ; original "C-h h" displays "hello world" in different languages
;;(define-key 'help-command (kbd "Meta m") 'discover-my-major)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)


(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; enable narrowing commands
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;; enabled change region case commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(global-set-key (kbd "C-x g") 'magit-status)

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



