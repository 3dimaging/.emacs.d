(evil-mode 1)
(setcdr evil-insert-state-map nil)
(setq evil-want-C-i-jump nil) 
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(setq evil-want-C-u-scroll t)
(global-evil-leader-mode 1)

(evil-leader/set-key
  "ff" 'find-file
  "fs" 'save-buffer
  "fr" 'recentf-open-files
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "4" 'select-window-4
  ":" 'counsel-M-x)
(require 'evil-surround)
(define-key evil-normal-state-map (kbd "/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "/") 'evilnc-comment-or-uncomment-lines)
;;(evilnc-default-hotkeys)
(add-hook 'occur-mode-hook
	  (lambda()
	    (evil-add-hjkl-bindings occur-mode-map 'emacs
	      (kbd "/") 'evil-search-forward
	      (kbd "n") 'evil-search-next
	      (kbd "N") 'evil-search-previous
	      (kbd "C-d") 'evil-scroll-down
	      (kbd "C-u") 'evil-scroll-up
	      )))

(dolist (mode '(ag-mode
		flycheck-error-list-mode
		git-rebase-mode))
  (add-to-list 'evil-emacs-state-modes mode))

(provide 'init-evil)
