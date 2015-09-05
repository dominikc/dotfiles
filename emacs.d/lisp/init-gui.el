(when (memq window-system '(mac ns))
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (set-frame-name "Emacs")

  (add-to-list 'default-frame-alist '(font . "Fira Mono-13"))
  (set-face-attribute 'default t :font "Fira Mono-13")
  (global-linum-mode)

  (global-prettify-symbols-mode 1)
  (global-git-gutter-mode +1)
  )

(guide-key-mode 1)
(setq-default guide-key/guide-key-sequence t
            guide-key/idle-delay 0.5)

; (smartparens-global-mode 1)

(provide 'init-gui)
