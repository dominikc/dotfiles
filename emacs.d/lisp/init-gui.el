(when (memq window-system '(mac ns))
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (set-frame-name "Emacs")

  (add-to-list 'default-frame-alist '(font . "Fira Mono-13"))
  (set-face-attribute 'default t :font "Fira Mono-13")
  (global-linum-mode)

  (global-prettify-symbols-mode 1)
  )

(when (maybe-require-package 'neotree)
  (setq neo-theme 'nerd)
  (evil-leader/set-key "e" 'neotree-projectile-action)
  )

(when (maybe-require-package 'indent-guide)
  (indent-guide-global-mode))

(provide 'init-gui)
