;; Apheleia automatically runs code formatters when a file is saved.
(use-package apheleia
  :ensure t
  :delight
  :commands (apheleia-mode
             apheleia-global-mode)
  :hook ((prog-mode . apheleia-mode))
  :config
  ;; python: ruff for general formatting
  (setf (alist-get 'ruff-format apheleia-formatters)
        '("ruff" "format" "--stdin-filename" buffer-file-name "-"))
  ;; python: also sort import lists
  (setf (alist-get 'ruff-sort apheleia-formatters)
        '("ruff" "check" "--select" "I" "--fix" "--stdin-filename" buffer-file-name "-"))
  ;; any extra args to shfmt disable editorconfig parsing!
  (setf (alist-get 'shfmt apheleia-formatters)
        '("shfmt" "-filename" buffer-file-name "-"))
  (setf (alist-get 'python-ts-mode apheleia-mode-alist) '(ruff-format ruff-sort)))

;; Delete trailing spaces on save.
(use-package stripspace
  :ensure t
  :delight stripspace-local-mode
  :commands stripspace-local-mode
  :hook ((prog-mode . stripspace-local-mode)
         (text-mode . stripspace-local-mode)
         (conf-mode . stripspace-local-mode))
  :custom
  (stripspace-only-if-initially-clean nil)
  (stripspace-restore-column t))

;; Enables automatic indentation of code while typing
(use-package aggressive-indent
  :ensure t
  :delight
  :commands (global-aggressive-indent-mode aggressive-indent-mode)
  :init
  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'python-ts-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'yaml-ts-mode))
