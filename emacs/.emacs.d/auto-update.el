;; Keep packages up-to-date automatically
(use-package auto-package-update
  :ensure t
  :custom
  (auto-package-update-interval 7) ;; days
  (auto-package-update-hide-results t)
  (auto-package-update-delete-old-versions t)
  :config
  ;; Update at startup if interval has elapsed.
  (auto-package-update-maybe)
  (auto-package-update-at-time "10:00"))
