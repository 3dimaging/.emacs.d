(require 'cl)

;;(when (>= emacs-major-version 24)
;;     (require 'package)
;;     (package-initialize)
;;     (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;     ;;(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;     ;;			      ("melpa" . "http://elpa.emacs-china.org/melpa/")))
;;     )



 ;; Add Packages
;; (defvar my/packages '(
;;                company
;;                hungry-delete
;;                swiper
;;                counsel
;;                smartparens
;;                js2-mode
;;                nodejs-repl
;;                exec-path-from-shell
;;		popwin
;;		reveal-in-osx-finder
;;		web-mode
;;		js2-refactor
;;		expand-region
;;		iedit
;;		org-pomodoro
;;		helm-ag 
;;		flycheck
;;		auto-yasnippet
  ;;              monokai-theme
;;		evil
;;		evil-leader
;;		window-numbering
;;		evil-surround
;;		evil-nerd-commenter
;;		which-key
;;		powerline
;;		powerline-evil
;;		ivy
;;		smartparens
;;		pallet
;;		;; my own packages
;;                solarized-theme
;;		helm
;;		helm-gtags
;;		ggtags
;;		;;for python
;;		ein 
;;		elpy
;;		py-autopep8
;;		websocket
;;		request
;;		dash
;;		s
;;		skewer-mode
;;		request-deferred
;;		smartrep
;;		org
;;		magit 
;;		;;for latex
;;		auctex
;;		auctex-latexmk
;;		auctex-lua
;;		company-auctex
;;		cdlatex
;;		latex-preview-pane
;;		
;;                ) "Default packages")
;;
;; (setq package-selected-packages my/packages)

;; (defun my/packages-installed-p ()
;;     (loop for pkg in my/packages
;;           when (not (package-installed-p pkg)) do (return nil)
;;           finally (return t)))

;; (unless (my/packages-installed-p)
;;     (message "%s" "Refreshing package database...")
;;     (package-refresh-contents)
;;     (dolist (pkg my/packages)
;;       (when (not (package-installed-p pkg))
;;         (package-install pkg))))

;; Find Executable Path on OS X
;;(setq exec-path-from-shell-variables '("PATH" "MANPATH" "GOROOT"))
;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))

;;(global-hungry-delete-mode)
(require 'smartparens-config)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(smartparens-global-mode t)

(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; config js2-mode for js files

(global-company-mode t)



(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

(global-set-key (kbd "M-s o") 'occur-dwim)
;; (global-set-key (kbd "M-s i") 'counsel-imenu)

(global-set-key (kbd "M-s i") 'counsel-imenu)

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-s e") 'iedit-mode)



;; Avy configuration
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "M-:") 'avy-goto-word-1)
;; lispy configuration
(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
(provide 'init-packages)
