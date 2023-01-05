(require 'latex-pretty-symbols)
(require 'latex-unicode-math-mode)
;; Enable latex-unicode-math-mode automatically for all LaTeX files.
;; This converts LaTeX to Unicode inside math environments.
(add-hook 'LaTeX-mode-hook 'latex-unicode-math-mode)

(latex-preview-pane-enable)
(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-selft t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 
	  (lambda()
	    (turn-off-auto-fill)
	    (outline-minor-mode 1)
	    (setq TeX-view-program-list '(("skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
	    (setq TeX-view-program-selection
		  '((output-pdf "skim")))
	    (setq TeX-global-PDF-mode t
		  TeX-engine 'xetex)
  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
  (setq TeX-command-default "XeLaTeX")
  (setq TeX-save-querynil )
  (setq TeX-show-compilation t)
))


(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
(autoload 'reftex-mode "reftex" "RefTeXMinorMode" t)
(autoload 'turn-on-reftex "reftex" "RefTeXMinorMode" nil)
(autoload 'reftex-citation "reftex-cite" "Makecitation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrasemode" t)
(latex-preview-pane-enable)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(autoload 'cdlatex-mode "cdlatex" "CDLaTeXMode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeXMode" nil)

(provide 'init-latex)
