;; Eglot is the emacs LSP client.
(use-package eglot
  :ensure t
  :defer t
  :custom
  (eglot-send-changes-idle-time 0.5)
  (eglot-extend-to-xref t)
  :hook
  ;; Automatically start eglot when we enter one of these modes:
  (python-ts-mode . eglot-ensure)
  (sh-mode . eglot-ensure)
  (bash-ts-mode . eglot-ensure)
  :config
  ;; Typically, language servers will read their configuration from the project directory.
  ;; For cases where you're editing a one-off file outside of a project, you can set the
  ;; default configuration for everything in `eglot-workspace-configuration'.
  (setq-default
   eglot-workspace-configuration
   '(:bashIde
     (:shfmt
      (:binaryNextLine t :caseIndent t :simplifyCode t :spaceRedirects t))))
  ;; Here we define the LSP executable corresponding to each programming mode.
  (add-to-list 'eglot-server-programs '((python-mode python-ts-mode) . ("basedpyright-langserver" "--stdio")))
  (add-to-list 'eglot-server-programs '((sh-mode bash-ts-mode) . ("bash-language-server" "start"))))
