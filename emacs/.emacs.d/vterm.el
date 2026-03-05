;; Native terminal inside of Emacs
(use-package vterm
  :if (bound-and-true-p module-file-suffix)
  :commands (vterm
             vterm-send-string
             vterm-send-return
             vterm-send-key
             vterm-module-compile)
  :preface
  (when noninteractive
    ;; vterm unnecessarily triggers compilation of vterm-module.so upon loading.
    ;; This prevents that during byte-compilation (`use-package' eagerly loads
    ;; packages when compiling).
    (advice-add #'vterm-module-compile :override #'ignore))

  (defun my-vterm--setup ()
    ;; Hide the mode-line
    (setq mode-line-format nil)
    ;; Inhibit early horizontal scrolling
    (setq-local hscroll-margin 0)
    ;; Suppress prompts for terminating active processes when closing vterm
    (setq-local confirm-kill-processes nil))

  :init
  (add-hook 'vterm-mode-hook #'my-vterm--setup)
  (setq vterm-timer-delay 0.05)  ; Faster vterm
  (setq vterm-kill-buffer-on-exit t)
  (setq vterm-max-scrollback 5000))
