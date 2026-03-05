;; Native compilation enhances Emacs performance by converting Elisp code into
;; native machine code, resulting in faster execution and improved
;; responsiveness.
;;
;; Make sure this file is included before other packages.
(use-package compile-angel
  :ensure t
  :demand t
  :delight compile-angel-on-load-mode
  :config
  ;; Let compile-angle handle building pacakges.
  (setq package-native-compile nil)
  (setq compile-angel-verbose t)
  (setq compile-angel-debug nil)

  ;; Prevent compile-angel from compiling our init files!
  (dolist (file
           (append
            my-config-files
            '("init"
              "early-init"
              "pre-init"
              "post-init"
              "pre-early-init"
              "post-early-init")))
    (push (concat "/" file ".el") compile-angel-excluded-files))

  ;; Compile all elisp files prior to loading them.
  (compile-angel-on-load-mode 1))
