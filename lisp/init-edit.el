;; Here is a list of powerful packages for efficient editting.
;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; move text
;; Meta-up move-text-up (line or active region)
;; Meta-down move-text-down (line or active region)
;;(move-text-default-bindings)
;; to show the column limit for example 78 character per line for python
(require 'fill-column-indicator)
(fci-mode 1)
;; to see the killing ring by M-y
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
(setq kill-ring-max 100) 
(setq x-select-enable-clipboard t) 
(setq select-active-regions t) 
(setq save-interprogram-paste-before-kill 1) 
(setq yank-pop-change-selection t) 


;; auto-symbol highlight is installed to show all the same key words automatically
;; her is the manual one, just in case I need it.
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; iedit is installed to edit all the keywords the same time.
;; When you have an active region that spans multiple lines, the following will add a cursor to each line:
;; When you want to add multiple cursors not based on continuous lines, but based on keywords in the buffer, use:
;; First mark the word, then add more cursors.
;; To get out of multiple-cursors-mode, press <return> or C-g. The latter will first disable multiple regions before disabling multiple cursors. If you want to insert a newline in multiple-cursors-mode, use C-j.

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Move to certain point and press C-; (The default key binding). All occurrences of a symbol, string or a region in the buffer are highlighted corresponding to the thing under the point, current mark and prefix argument. Refer to the document of `iedit-mode’ for details.
;; Edit one of the occurrences The change is applied to other occurrences simultaneously.
;; Finish - by pressing C-; again
(require 'iedit)

(require 'evil-surround)
(global-evil-surround-mode 1)


(setq helm-M-x-fuzzy-match t
      helm-mode-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t
      helm-locate-fuzzy-match t
      helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match t
      helm-completion-in-region-fuzzy-match t
      helm-candidate-number-list 150
      helm-split-window-in-side-p t
      helm-move-to-line-cycle-in-source t
      helm-echo-input-in-header-line t
      helm-autoresize-max-height 0
      helm-autoresize-min-height 20)


(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)
;; the following two key bindings are for fix-isearch package.
(global-set-key (kbd "C-M-r") #'fix-isearch-backward)
(global-set-key (kbd "C-M-s") #'fix-isearch-forward)
;; the following for  adding "" by press v-i-m then S then "; to change use =cs then " then '
;;(require 'evil-surround)
(global-evil-surround-mode)
;; Ztree for directories diff
(require 'ztree)
(provide 'init-edit)
