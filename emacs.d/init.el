(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; Init pallet
(require 'pallet)
(pallet-mode t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(setq make-backup-files nil)
(auto-save-mode)

(setq company-idle-delay 0.2
    company-tooltip-limit 10
    company-minimum-prefix-length 1
    company-tooltip-flip-when-above t)
(global-company-mode 1)

(require 'init-evil)
(require 'init-helm)
(require 'init-gui)
(require 'init-syntax)

(setq solarized-distinct-fringe-background t)
(require 'solarized-light-theme)
