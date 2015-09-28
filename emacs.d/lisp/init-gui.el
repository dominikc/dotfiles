(when (memq window-system '(mac ns))
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (setq frame-title-format "%b")

  (add-to-list 'default-frame-alist '(font . "Fira Mono-13"))
  (set-face-attribute 'default t :font "Fira Mono-13")
  (global-linum-mode)

  (global-prettify-symbols-mode 1)

  (require 'git-gutter-fringe)
  (global-git-gutter-mode +1)
  (setq git-gutter-fr:side 'right-fringe)
  )
(require 'zenburn-theme)

(global-hl-line-mode)
(indent-guide-global-mode)
(setq which-key-idle-delay 0.3)
(which-key-mode 1)

(diminish 'evil-commentary-mode)
(diminish 'which-key-mode)
(diminish 'undo-tree-mode)
(diminish 'yas-minor-mode)
(diminish 'company-mode)
(diminish 'helm-mode)
(diminish 'abbrev-mode)
(diminish 'indent-guide-mode)

(global-set-key (kbd "C-x e") 'neotree-projectile-action)

(setq uniquify-buffer-name-style 'forward)
(provide 'init-gui)
