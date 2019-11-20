
(require 'ein)
;;(require 'ein-loaddefs)
(require 'ein-notebook)
(require 'ein-subpackages)
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

(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))

(provide 'init-python)
