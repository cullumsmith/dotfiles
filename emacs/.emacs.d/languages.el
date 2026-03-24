(setq-default sh-basic-offset 2)

(use-package treesit
  :ensure nil
  :config
  (setq major-mode-remap-alist
        '((yaml-mode . yaml-ts-mode)
          (bash-mode . bash-ts-mode)
          (js2-mode . js-ts-mode)
          (typescript-mode . typescript-ts-mode)
          (json-mode . json-ts-mode)
          (css-mode . css-ts-mode)
          (python-mode . python-ts-mode))))

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package eldoc
  :ensure nil
  :delight)

;; Highlights function and variable definitions in Emacs Lisp mode
(use-package highlight-defined
  :ensure t
  :commands highlight-defined-mode
  :hook
  (emacs-lisp-mode . highlight-defined-mode))

;; Prevent parenthesis imbalance
(use-package smartparens
  :ensure t
  :hook
  ((prog-mode text-mode markdown-mode) . smartparens-mode)
  ((emacs-lisp-mode python-mode python-ts-mode) . turn-on-smartparens-strict-mode)
  :config
  (require 'smartparens-config)
  :bind
  (:map smartparens-mode-map
        ("C-M-f" . sp-forward-sexp)
        ("C-M-b" . sp-backward-sexp)

        ("C-M-d" . sp-down-sexp)
        ("C-M-a" . sp-backward-down-sexp)
        ("C-S-d" . sp-beginning-of-sexp)
        ("C-S-a" . sp-end-of-sexp)

        ("C-M-e" . sp-up-sexp)
        ("C-M-u" . sp-backward-up-sexp)
        ("C-M-t"  . sp-transpose-sexp)

        ("C-M-n" . sp-forward-hybrid-sexp)
        ("C-M-p"  . sp-backward-hybrid-sexp)

        ("C-M-k" . sp-kill-sexp)
        ("C-M-w" . sp-copy-sexp)

        ("M-(" . sp-unwrap-sexp)
        ("M-)"   . sp-wrap-round)
        ("M-]"   . sp-wrap-square)

        ("C-)" . sp-forward-slurp-sexp)
        ("C-(" . sp-forward-barf-sexp)
        ("C-M-)" . sp-backward-slurp-sexp)
        ("C-M-(" . sp-backward-barf-sexp)

        ("M-D" . sp-splice-sexp)
        ("C-M-<delete>" . sp-splice-sexp-killing-forward)
        ("C-M-<backspace>" . sp-splice-sexp-killing-backward)
        ("C-S-<backspace>" . sp-splice-sexp-killing-around)

        ("M-F" . sp-forward-symbol)
        ("M-B" . sp-backward-symbol)

        ("C-\"" . sp-change-inner)
        ("C-M-\"" . sp-change-inner)

        ("C-M-;" . sp-comment-sexp))
  (:map emacs-lisp-mode-map
        (";".  sp-comment)))

;; Provides functions to find references to functions, macros, variables,
;; special forms, and symbols in Emacs Lisp
(use-package elisp-refs
  :ensure t
  :commands (elisp-refs-function
             elisp-refs-macro
             elisp-refs-variable
             elisp-refs-special
             elisp-refs-symbol))

;; CSV file support with automatic column alignment. This configuration enables
;; csv-align-mode whenever a CSV file is opened, improving readability by
;; keeping columns visually aligned according to a configurable maximum width
;; and a set of recognized field separators.
(use-package csv-mode
  :commands (csv-mode
             csv-align-mode
             csv-guess-set-separator)
  :mode ("\\.csv\\'" . csv-mode)
  :hook ((csv-mode . csv-align-mode)
         (csv-mode . csv-guess-set-separator))
  :custom
  (csv-align-max-width 100)
  (csv-separators '("," ";" " " "|" "\t")))

;; Major mode for editing crontab files
(use-package crontab-mode
  :commands crontab-mode
  :mode ("/crontab\\(\\.X*[[:alnum:]]+\\)?\\'"  . crontab-mode))

;; Major mode for editing Nginx configuration files
(use-package nginx-mode
  :commands nginx-mode
  :mode (("nginx\\.conf\\'" . nginx-mode)
         ("/nginx/.+\\.conf\\'" . nginx-mode)))

(use-package markdown-mode
  :commands (gfm-mode
             gfm-view-mode
             markdown-mode
             markdown-view-mode)
  :mode (("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode)
         ("README\\.md\\'" . gfm-mode)))
