(defvar my-font "Liberation Mono 9"
  "Default font.")

(set-frame-font my-font nil t)
(set-face-attribute 'fixed-pitch nil :family 'unspecified)

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(use-package delight
  :ensure t)
