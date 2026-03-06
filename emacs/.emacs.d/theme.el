(set-frame-font "Terminus 10" nil t)
(set-face-attribute 'fixed-pitch nil :family 'unspecified)

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(use-package delight
  :ensure t)
