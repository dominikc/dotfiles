(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(setq ad-redefinition-action 'accept)
(setq backup-directory-alist `(("." . "~/.emacs.d/backup")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)


;; Init pallet
(require 'pallet)
(pallet-mode t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(setq make-backup-files nil)
(auto-save-mode)

(require 'init-evil)
(require 'init-helm)
(require 'init-gui)
(require 'init-syntax)

(powerline-default-theme)
