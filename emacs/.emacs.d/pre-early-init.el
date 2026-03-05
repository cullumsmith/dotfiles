;;; pre-early-init.el --- pre-early-init -*- no-byte-compile: t; lexical-binding: t; -*-

;; Reduce clutter in ~/.emacs.d by redirecting files to ~/.emacs.d/var/.
;; If /usr/local/home/${USER} exists, we use that directory instead (NFS is slow).
(if (file-directory-p (format "/usr/local/home/%s" (user-login-name)))
    (progn
      (setq user-emacs-directory (format "/usr/local/home/%s/.emacs.d/var" (user-login-name)))
      (setq package-user-dir (format "/usr/local/home/%s/.emacs.d/elpa" (user-login-name))))
  (progn
    (setq user-emacs-directory (expand-file-name "var/" user-emacs-directory))
    (setq package-user-dir (expand-file-name "elpa" user-emacs-directory))))

;; Prevent minimal-emacs from disabling all the UI elements.
(setq minimal-emacs-ui-features '(menu-bar context-menu tooltips))
