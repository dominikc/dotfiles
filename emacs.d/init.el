(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'exec-path "/usr/local/bin")


(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(require 'init-elpa)
(require 'init-evil)

(require 'init-gui)
(require 'init-powerline)
(require 'init-git)
(require 'init-helm)
(require 'init-keys)

(require 'init-lang-haml)
(require 'init-lang-js)
(require 'init-lang-ruby)

(when (maybe-require-package 'company)
  (setq company-idle-delay 0.5
        company-tooltip-limit 10
        company-minimum-prefix-length 1
        company-tooltip-flip-when-above t)
  (global-company-mode 1)
  )

(when (maybe-require-package 'flycheck)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (global-flycheck-mode))

(maybe-require-package 'guide-key)
(maybe-require-package 'powerline)
(when (maybe-require-package 'yasnippet)
  (yas-global-mode)
  (yas-activate-extra-mode 'ruby-mode))
(load-theme 'base16-tomorrow-dark t)

(when (maybe-require-package 'whitespace-cleanup-mode)
  (global-whitespace-cleanup-mode))

(setq make-backup-files nil)
(auto-save-mode) ; Disable auto save

(guide-key-mode 1)
(setq-default guide-key/guide-key-sequence t
              guide-key/idle-delay 0.5)

(when (maybe-require-package 'smartparens)
  (smartparens-global-mode 1))

(when (maybe-require-package 'diminish)
  (diminish 'evil-commentary-mode)
  (diminish 'guide-key-mode)
  (diminish 'helm-mode)
  (diminish 'whitespace-cleanup-mode)
  (diminish 'abbrev-mode)
  (diminish 'undo-tree-mode)
  (diminish 'yas-minor-mode)
  )

(setq projectile-mode-line '(:eval (format " [%s]" (projectile-project-name))))
(maybe-require-package 'molokai-theme)
(maybe-require-package 'solarized-theme)
(maybe-require-package 'zenburn-theme)
(maybe-require-package 'base16-theme)
(maybe-require-package 'material-theme)

(load-theme 'material t)
