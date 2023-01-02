(require 'cl)

(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
     (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
     (setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
     			      ("melpa" . "https://melpa.org/packages/")))
     )



 ;; Add Packages
 (defvar my/packages '(
                company
                hungry-delete
                swiper
                counsel
                smartparens
                js2-mode
                nodejs-repl
                exec-path-from-shell
		popwin
		reveal-in-osx-finder
		web-mode
		js2-refactor
		expand-region
		iedit
		org-pomodoro
		helm-ag 
		flycheck
		auto-yasnippet
                monokai-theme
		evil
		evil-leader
		window-numbering
		evil-surround
		evil-nerd-commenter
		which-key
		powerline
		powerline-evil
		ivy
		smartparens
		;;pallet
;;		;; my own packages
                solarized-theme
		helm
		helm-gtags
		ggtags
;;		;;for python
		ein 
		elpy
		py-autopep8
		websocket
		request
		dash
		s
		skewer-mode
		request-deferred
		smartrep
		org
		magit 
;;		;;for latex
		auctex
		auctex-latexmk
		auctex-lua
		company-auctex
		cdlatex
		latex-preview-pane
;;		
                ) )
;;
(setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

;; Find Executable Path on OS X
(setq exec-path-from-shell-variables '("PATH" "MANPATH" "GOROOT"))
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

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
(setq company-show-numbers t)
(setf company-tooltip-limit 5)

(require 'all-the-icons)

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-smart-open t)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(require 'helm-mode)
(require 'helm-config)
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))
(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

;;(helm-mode 1)

(global-set-key (kbd "C-'") 'avy-goto-char-2)

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

(setq neo-window-fixed-size nil)
(provide 'init-packages)
