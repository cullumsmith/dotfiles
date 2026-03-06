;; post-init.el --- post-init -*- no-byte-compile: t; lexical-binding: t; -*-

(setq my-config-files
      '("compilation"
        "local"
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
(dolist (name my-config-files)
  (let  ((file (expand-file-name
                (concat name ".el")
                minimal-emacs-user-directory)))
    (when (file-exists-p file)
      (load-file file))))
