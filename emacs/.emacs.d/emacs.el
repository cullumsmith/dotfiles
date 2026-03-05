;; Emacs is not actually a package. But we put all the "generic" configs in here.
;; test
(use-package emacs
  :init
  (setq user-full-name "Cullum Smith"
        user-mail-address "cullum@sacredheartsc.com")

  ;; tab = 2 spaces.
  (setq-default tab-width 2)
  (setq-default indent-tabs-mode nil)

  ;; Enable `auto-save-mode' to prevent data loss.
  ;; Enable
  (setq auto-save-default t)
  (setq auto-save-interval 300)
  (setq auto-save-timeout 30)
  (setq auto-save-file-name-transforms
        `((".*" ,(expand-file-name "auto-saves/" user-emacs-directory) t)))
  (mkdir (expand-file-name "auto-saves/" user-emacs-directory) t)

  ;; Enables visual indication of minibuffer recursion depth
  (minibuffer-depth-indicate-mode 1)

  ;; Native tooltips in graphical mode
  (tooltip-mode 1)
  (setq tooltip-hide-delay 20)    ; Time in seconds before a tooltip disappears (default: 10)
  (setq tooltip-delay 0.4)        ; Delay before showing a tooltip after mouse hover (default: 0.7)
  (setq tooltip-short-delay 0.08) ; Delay before showing a short tooltip (Default: 0.1)

  ;; Allow resizing windows with the mouse.
  (window-divider-mode 1) ;; resize windows with the mouse
  (show-paren-mode 1) ;; highlight matching parens
  (global-hl-line-mode 1) ;; highlight the current line
  (delete-selection-mode 1) ;; typed text replaces the selection

  ;; Allow Emacs to upgrade built-in packages
  (setq package-install-upgrade-built-in t)

  ;; Display the current line and column numbers in the mode line
  (setq line-number-mode t)
  (setq column-number-mode t)
  (setq mode-line-position-column-line-format '("%l:%C"))

  ;; Display of line numbers in the buffer:
  (setq-default display-line-numbers-type 'relative)
  (dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
    (add-hook hook #'display-line-numbers-mode)))

;; Native tab bar
(use-package tab-bar
  :ensure nil
  :commands (tab-bar-mode)
  :init
  (tab-bar-mode 1)
  (setq tab-bar-show 1
        tab-bar-new-tab-choice "*scratch*"
        tab-bar-tab-hints t
        tab-bar-select-tab-modifiers '(control)))

;; Move directionally between windows
(use-package windmove
  :ensure nil
  :config
  ;; shift + arrow keys
  (windmove-default-keybindings))

;; Automatically updated the buffer when the underlying file is modified.
(use-package autorevert
  :ensure nil
  :commands (auto-revert-mode global-auto-revert-mode)
  :hook
  (after-init . global-auto-revert-mode)
  :init
  (setq auto-revert-interval 3)
  (setq auto-revert-remote-files nil)
  (setq auto-revert-use-notify t)
  (setq auto-revert-avoid-polling nil)
  (setq auto-revert-verbose t))

;; Preserve minibuffer history between sessions.
(use-package savehist
  :ensure nil
  :commands (savehist-mode savehist-save)
  :hook
  (after-init . savehist-mode)
  :init
  (setq history-length 300)
  (setq savehist-autosave-interval 600))

;; Remember the cursor location within a file.
(use-package saveplace
  :ensure nil
  :commands (save-place-mode save-place-local-mode)
  :hook
  (after-init . save-place-mode)
  :init
  (setq save-place-limit 400))

;; Keep list of recently opened files.
(use-package recentf
  :ensure nil
  :commands (recentf-mode recentf-cleanup)
  :hook
  (after-init . recentf-mode)

  :init
  (setq recentf-auto-cleanup (if (daemonp) 300 'never))
  (setq recentf-exclude
        (list "\\.tar$" "\\.tbz2$" "\\.tbz$" "\\.tgz$" "\\.bz2$"
              "\\.bz$" "\\.gz$" "\\.gzip$" "\\.xz$" "\\.zip$"
              "\\.7z$" "\\.rar$"
              "COMMIT_EDITMSG\\'"
              "\\.\\(?:gz\\|gif\\|svg\\|png\\|jpe?g\\|bmp\\|xpm\\)$"
              "-autoloads\\.el$" "autoload\\.el$"))
  :config
  ;; A cleanup depth of -90 ensures that `recentf-cleanup' runs before
  ;; `recentf-save-list', allowing stale entries to be removed before the list
  ;; is saved by `recentf-save-list', which is automatically added to
  ;; `kill-emacs-hook' by `recentf-mode'.
  (add-hook 'kill-emacs-hook #'recentf-cleanup -90))

;; Enable automatic insertion and management of matching pairs of characters
(use-package elec-pair
  :ensure nil
  :commands (electric-pair-mode
             electric-pair-local-mode
             electric-pair-delete-pair)
  :hook (after-init . electric-pair-mode))
