
(require 'ein)
;;(require 'ein-loaddefs)
(require 'ein-notebook)
;;(require 'ein-subpackages)
(require 'ob-ipython)
(require 'py-autopep8)

(elpy-enable)
(setq elpy-rpc-python-command "/home/wli/env/bin/python3")
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))
;;(elpy-use-ipython)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(setq python-shell-interpreter "ipython")

(add-hook 'python-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends) '((company-anaconda company-dabbrev-code)
							   company-dabbrev)))
	  )
;; Inside a Python file, move the cursor to some function/method definition and hit C-c M-d (see gif demo below).
(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)
			      (require 'python-docstring)
			      (python-docstring-mode t)
			      (auto-highlight-symbol-mode t)
			      (fci-mode t)
			      ))
;; This is a minor-mode for Emacs for editing Python docstrings. It provides syntax highlighting for docstrings in both reStructuredText and Epydoc formats, as well as an override for the fill-paragraph function when editing such a docstring that will wrap things according to Python community convention.


;; here comes the indent-tools
(require 'indent-tools)
;; (global-set-key (kbd "C-c >") 'indent-tools-hydra/body)
(add-hook 'python-mode-hook
	  (lambda () (define-key python-mode-map (kbd "C-c >") 'indent-tools-hydra/body)))

;; the following is elpygen to use yasnapit to insert function or classes

(require 'elpygen)
(define-key python-mode-map (kbd "C-c i") 'elpygen-implement)

;; here is pyimport
(require 'pyimport)
(setq pyimport-pyflakes-path "/home/wli/env/bin/pyflakes")
(define-key python-mode-map (kbd "C-c C-i") #'pyimport-insert-missing)
(define-key python-mode-map (kbd "C-c C-R") #'pyimport-remove-unused)

(defun my-merge-imenu ()
  (interactive)
  (let ((mode-imenu (imenu-default-create-index-function))
        (custom-imenu (imenu--generic-function imenu-generic-expression)))
    (append mode-imenu custom-imenu)))

(defun my-python-hooks()
    (interactive)
    (setq tab-width     4
          python-indent 4
          python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i")
    (if (string-match-p "rita" (or (buffer-file-name) ""))
        (setq indent-tabs-mode t)
      (setq indent-tabs-mode nil)
    )
    (add-to-list
        'imenu-generic-expression
        '("Sections" "^#### \\[ \\(.*\\) \\]$" 1))
    (setq imenu-create-index-function 'my-merge-imenu)
    ;; pythom mode keybindings
    (define-key python-mode-map (kbd "M-.") 'jedi:goto-definition)
    (define-key python-mode-map (kbd "M-,") 'jedi:goto-definition-pop-marker)
    (define-key python-mode-map (kbd "M-/") 'jedi:show-doc)
    (define-key python-mode-map (kbd "M-?") 'helm-jedi-related-names)
    ;; end python mode keybindings

    (eval-after-load "company"
        '(progn
            (unless (member 'company-jedi (car company-backends))
                (setq comp-back (car company-backends))
                (push 'company-jedi comp-back)
                (setq company-backends (list comp-back)))
            )))

(add-hook 'python-mode-hook 'my-python-hooks)

(provide 'init-python)
