;; Here I just record what I did to make the ccls works for c++ development.
;; Apirl 4, 2020
;; First, I want to try to get C++ IDE in emacs by using LSP.
;; I read the document of M-emacs about the c++ setup for emacs. I found it use ccls.
;; I use homebrew to install ccls first on Mac. it takes very long to install everything.
;; My first try to install ccls is a failure because it need the command line xcode although I already installed xcode before.
;; 
(add-hook 'after-init-hook #'global-flycheck-mode)
(use-package ccls
  :defer t
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp)))
  :custom
  (ccls-executable (executable-find "/usr/local/bin/ccls")) ; Add ccls to path if you haven't done so
  (ccls-sem-highlight-method 'font-lock)
  (ccls-enable-skipped-ranges nil)
  :config
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-tramp-connection (cons ccls-executable ccls-args))
    :major-modes '(c-mode c++-mode cuda-mode objc-mode)
    :server-id 'ccls-remote
    :multi-root nil
    :remote? t
    :notification-handlers
    (lsp-ht ("$ccls/publishSkippedRanges" #'ccls--publish-skipped-ranges)
            ("$ccls/publishSemanticHighlight" #'ccls--publish-semantic-highlight))
    :initialization-options (lambda () ccls-initialization-options)
    :library-folders-fn nil)))

(use-package lsp-mode :commands lsp :ensure t)
(use-package lsp-ui :commands lsp-ui-mode :ensure t)
;; (use-package company-lsp
;;   :ensure t
;;   :commands company-lsp
;;   :config (push 'company-lsp company-backends))
;; add company-lsp as a backend
(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "/usr/local/bin/ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))
(require 'ccls)
(setq ccls-executable "/usr/local/bin/ccls")
(provide 'init-cpp)
