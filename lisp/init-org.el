(require 'org)
(setq org-src-fontify-natively t)
(setq org-agenda-files '("~/Documents/emacs-org"))
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)))
(global-set-key (kbd "C-c r") 'org-capture)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ipython . t)))
   ;; other languages..
(setq org-src-fontify-natively nil)
;;(require 'org-install)
;;(org-babel-load-file (expand-file-name "zilongshanren.org") user-emacs-directory)
(require 'org-pomodoro)
(add-to-list 'org-emphasis-alist
	     '("*" (:foreground "red")))
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
(provide 'init-org)
