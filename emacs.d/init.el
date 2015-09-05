(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(setq ad-redefinition-action 'accept)

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

(setq solarized-distinct-fringe-background t)
(require 'solarized-light-theme)

(powerline-default-theme)
