;; post-init.el --- post-init -*- no-byte-compile: t; lexical-binding: t; -*-

(setq my-config-files
      '("compilation"
        "emacs"
        "theme"
        "files"
        "session"
        "help"
        "undo"
        "completion"
        "eglot"
        "spellcheck"
        "org"
        "formatters"
        "folding"
        "languages"
        "git"
        "vterm"
        "auto-update"))
(dolist (file my-config-files)
  (load-file (expand-file-name (concat file ".el") minimal-emacs-user-directory)))
