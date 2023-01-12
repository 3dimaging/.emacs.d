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
		      ;; 0. Package 
		      use-package
		      ;; 1. Programming related
		      ;; 1.0 general
		      company  ;; text completion ; complete anything
		      company-box
		      ivy ;; another text completion from abo-abo
		      counsel
		      auto-yasnippet
		      flycheck
		      fill-column-indicator
		      highlight-symbol
		      projectile
		      helm-projectile
		      ;; 1.1 javascript and web
		      js2-mode
		      ;;nodes-Real
		      js2-refactor
		      skewer-mode
		      ;; 1.2 lisp
		      lispy
		      dash
		      s
		      ;; 1.3 python
		      ein
		      elpy
		      elpygen
		      py-autopep8
		      request-deferred
		      ob-ipython
		      indent-tools
		      pyimport
		      ;; 1.4 latex
		      auctex
		      auctex-latexmk
		      auctex-lua
		      company-auctex
		      cdlatex
		      latex-preview-pane
		      latex-pretty-symbols
		      latex-unicode-math-mode
		      ;; 1.5 org
		      org
		      org-pomodoro
		      ;; 2. Text editing
		      hungry-delete ;; delete more space
		      smartparens  ;; automatically insert pairs
		      expand-region  ;; Expand region increases the selected region by semantic units
		      iedit ;; edit multple occurrences
		      evil  ;; vim simulator
		      evil-leader  ;; set leader key
		      evil-surround
		      evil-nerd-commenter
		      ;; brow-kill-ring
		      browse-kill-ring
		      multiple-cursors
		      smartrep
		      ;; 3. Text search
		      swiper
		      helm
		      helm-ag
		      ;;occur
		      ;; 4. Navigation
		      ;; 4.1 window navigate
		      window-numbering
		      popwin
		      ;; 4.2 buffer navigate
		      ;; 4.3 text navigate
		      ggtags
		      helm-gtags
		      avy
		      ;; 4.4 command navigate
		      which-key
		      ;; 5. UI
		      molokai-theme
		      solarized-theme
		      moe-theme
		      doom-themes
		      doom-modeline
		      powerline
		      powerline-evil
		      all-the-icons
		      all-the-icons-ivy
		      dashboard
		      beacon
		      nyan-mode
		      neotree
		      ivy-posframe
		      ;;awesome-tab ;; download file only, no install
		      ;; 6. Utilizes
		      exec-path-from-shell
		      reveal-in-osx-finder
		      websocket
		      request
		      magit
		      ztree) )
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


(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

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
(global-set-key (kbd "C-x g") 'magit-status)

;; A quick major mode help with discover-my-major; The setup binds C-h h m to discover-my-major.
(global-unset-key (kbd "C-h h"))        ; original "C-h h" displays "hello world" in different languages
;;(define-key 'help-command (kbd "Meta m") 'discover-my-major)
(use-package highlight-symbol :ensure t
  :config
  (set-face-attribute 'highlight-symbol-face nil
                      :background "default"
                      :foreground "#FA009A")
  (setq highlight-symbol-idle-delay 0)
  (setq highlight-symbol-on-navigation-p t)
  (add-hook 'prog-mode-hook #'highlight-symbol-mode)
  (add-hook 'prog-mode-hook #'highlight-symbol-nav-mode)
  ;; :bind-key ("C-f3" 'highlight-symbol)
  )

(require 'smartrep)
(smartrep-define-key
 global-map "C-x"
 '(("{" . shrink-window-horizontally)
   ("}" . enlarge-window-horizontally)))
(provide 'init-packages)
