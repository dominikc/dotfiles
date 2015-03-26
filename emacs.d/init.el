(custom-set-variables
 '(custom-safe-themes
   (quote
    ("8288b9b453cdd2398339a9fd0cec94105bc5ca79b86695bd7bf0381b1fbe8147" "42ccd5eadda3546a89026b94794df7f4addadf25417b96917cf9db2f892b25a4" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))
(custom-set-faces)

(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(set-default 'truncate-lines t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(menu-bar-mode -1)

(evil-commentary-mode)
(setq elscreen-display-screen-number nil)
(setq elscreen-tab-display-kill-screen nil)
(setq elscreen-tab-display-control nil)
(global-evil-tabs-mode t)
(global-evil-surround-mode t)
(global-evil-matchit-mode t)
(evil-mode 1)
(yas-global-mode 1)

;; Evil
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)

;; Indent
(setq js-indent-level 2)
(setq css-indent-offset 2)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
(setq-default evil-shift-width 2)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

(setq linum-format "%4d \u2502 ")
(global-hl-line-mode 1)
(global-linum-mode 1)
(global-git-gutter-mode t)
(git-gutter:linum-setup)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(helm-mode 1)

(load-theme 'smyx t)
(sml/setup)
(sml/apply-theme 'light)
;;; init.el ends here
