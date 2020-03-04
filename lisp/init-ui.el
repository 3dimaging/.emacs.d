(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(setq-default cursor-type 'bar)
(global-hl-line-mode t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(window-numbering-mode 1)
(require 'powerline)
(powerline-default-theme)
;; (require 'powerline-evil)
(load-theme 'moe-dark t)
;; (load-theme 'nimbus t)
;; (load-theme 'leuven t)

;;(set-face-background 'highlight-indentation-face "#e3e3d3")
;;(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
(require 'beacon)
(beacon-mode 1)
(setq beacon-blink-delay '0.2)
(setq beacon-blink-when-focused 't)
(setq beacon-dont-blink-commands 'nil)
(setq beacon-push-mark '1)
(setq beacon-color '1)

(require 'dashboard)
(dashboard-setup-startup-hook)
;; Set the title
(setq dashboard-banner-logo-title "Welcome to Emacs!")
;; Set the banner
(setq dashboard-startup-banner 'logo)
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png" which displays whatever image you would prefer

;; Content is not centered by default. To center, set
(setq dashboard-center-content t)

(require 'awesome-tab)
(awesome-tab-mode t)

(case window-system
  ((x w32) (nyan-mode)))
(nyan-mode t)

(require 'neotree)
(global-set-key [f9] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(require 'color-theme)
;;(require 'color-theme-solarized)
(color-theme-initialize)
;; set dark theme
;;(color-theme-solarized-dark)
;; set light theme
(setq treemacs-follow-after-init          t
          treemacs-width                      35
          treemacs-indentation                2
          treemacs-git-integration            t
          treemacs-collapse-dirs              3
          treemacs-silent-refresh             nil
          treemacs-change-root-without-asking nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-show-hidden-files          t
          treemacs-never-persist              nil
          treemacs-is-never-other-window      nil
          treemacs-goto-tag-strategy          'refetch-index)

   ;; (treemacs-follow-mode t)
   ;; (treemacs-filewatch-mode t)
;; for tabbar-ruler

;;(setq tabbar-ruler-global-tabbar nil)    ; get tabbar
;;(setq tabbar-ruler-global-ruler nil)     ; get global ruler
;;(setq tabbar-ruler-popup-menu t)       ; get popup menu.
;;(setq tabbar-ruler-popup-toolbar t)    ; get popup toolbar
;;(setq tabbar-ruler-popup-scrollbar nil)  ; show scroll-bar on mouse-move
;; (require 'tabbar-ruler)

;; for powerline

;; (set-face-attribute 'mode-line nil
                    ;; :foreground "Green"
                    ;; :background "Purple"
                    ;; :box nil)

(require 'doom-modeline)
(doom-modeline-mode 1)
(setq doom-modeline-height 20)
(setq doom-modeline-bar-width 3)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)
;; (setq powerline-arrow-shape 'arrow14)

;; set the transparency of Emacs
(set-frame-parameter (selected-frame) 'alpha '(100 . 100))
(add-to-list 'default-frame-alist '(alpha . (100 . 100)))

;; (set-face-attribute 'default nil :stipple “/Users/liw17/Documents/1552-4.jpg”) 
(setq solarized-distinct-fringe-background t)

;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch nil)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

;; Use less bolding
(setq solarized-use-less-bold t)

;; Use more italics
(setq solarized-use-more-italic t)

;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)

;; Avoid all font-size changes
(setq solarized-height-minus-1 1.0)
(setq solarized-height-plus-1 1.0)
(setq solarized-height-plus-2 1.0)
(setq solarized-height-plus-3 1.0)
(setq solarized-height-plus-4 1.0)
;(color-theme-solarized-light)
;; (load-theme 'monokai t)
(require 'popwin)
(popwin-mode t)


(use-package all-the-icons-ivy
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup))


(all-the-icons-ivy-setup)

(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(setq company-box-icons-lsp
      `(( 1  . ,(all-the-icons-faicon "file-text-o" :v-adjust -0.0575))     ; Text
        ( 2  . ,(all-the-icons-faicon "cube" :v-adjust -0.0575))            ; Method
        ( 3  . ,(all-the-icons-faicon "cube" :v-adjust -0.0575))            ; Function
        ( 4  . ,(all-the-icons-faicon "cube" :v-adjust -0.0575))            ; Constructor
        ( 5  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Field
        ( 6  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Variable
        ( 7  . ,(all-the-icons-faicon "cog" :v-adjust -0.0575))             ; Class
        ( 8  . ,(all-the-icons-faicon "cogs" :v-adjust -0.0575))            ; Interface
        ( 9  . ,(all-the-icons-alltheicon "less"))                          ; Module
        (10  . ,(all-the-icons-faicon "wrench" :v-adjust -0.0575))          ; Property
        (11  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Unit
        (12  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Value
        (13  . ,(all-the-icons-material "content_copy" :v-adjust -0.2))     ; Enum
        (14  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Keyword
        (15  . ,(all-the-icons-material "content_paste" :v-adjust -0.2))    ; Snippet
        (16  . ,(all-the-icons-material "palette" :v-adjust -0.2))          ; Color
        (17  . ,(all-the-icons-faicon "file" :v-adjust -0.0575))            ; File
        (18  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Reference
        (19  . ,(all-the-icons-faicon "folder" :v-adjust -0.0575))          ; Folder
        (20  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; EnumMember
        (21  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Constant
        (22  . ,(all-the-icons-faicon "cog" :v-adjust -0.0575))             ; Struct
        (23  . ,(all-the-icons-faicon "bolt" :v-adjust -0.0575))            ; Event
        (24  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Operator
        (25  . ,(all-the-icons-faicon "cog" :v-adjust -0.0575))             ; TypeParameter
        ))

(setq company-box-icons-alist 'company-box-icons-all-the-icons)


(provide 'init-ui)
