;;; package --- Summary
(custom-set-variables
 '(custom-safe-themes
   (quote
    ("e80932ca56b0f109f8545576531d3fc79487ca35a9a9693b62bf30d6d08c9aaf" "a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "8288b9b453cdd2398339a9fd0cec94105bc5ca79b86695bd7bf0381b1fbe8147" "42ccd5eadda3546a89026b94794df7f4addadf25417b96917cf9db2f892b25a4" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))
(custom-set-faces)

;;; Code:

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
(global-evil-surround-mode t)
(global-evil-matchit-mode t)
(evil-mode 1)
(yas-global-mode 1)

;; Evil
(defvar evil-normal-state-map)
(defvar evil-visual-state-map)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)

;; Indent
(defvar js-indent-level)
(defvar css-indent-offset)
(setq js-indent-level 2)
(setq css-indent-offset 2)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
(setq-default evil-shift-width 2)

(defvar company-idle-delay)
(defvar company-minimum-prefix-length)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

(defvar linum-format)
(setq linum-format "%4d \u2502 ")
(global-hl-line-mode 1)
(global-linum-mode 1)

(projectile-global-mode)
(defvar projectile-completion-system)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(helm-mode 1)
(helm-descbinds-mode 1)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(load-theme 'monokai t)
(powerline-center-theme)

;;; Commentary:
;;; init.el ends here
