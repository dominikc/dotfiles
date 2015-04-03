;; -*- mode: dotspacemacs -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers '(company-mode git ruby javascript tmux osx colors)
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-startup-banner 'official
   dotspacemacs-themes '(monokai zenburn)

   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-command-key ":"
   dotspacemacs-enable-paste-micro-state t
   dotspacemacs-guide-key-delay 0.4
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-persistent-server nil
   dotspacemacs-default-package-repository nil
   ruby-enable-ruby-on-rails-support t
   ruby-version-manager 'rbenv
   )
  )

(defun dotspacemacs/config ()
  (global-linum-mode)
  (linum-relative-toggle)
  (toggle-truncate-lines)

  (setq js-indent-level 2)
  (setq-default web-mode-markup-indent-offset 2 web-mode-css-indent-offset 2 web-mode-code-indent-offset 2)
  (setq css-indent-offset 2)
  (setq-default js2-basic-offset 2)

  (setq-default tab-width 2)
  (setq indent-line-function 'insert-tab)
  (setq-default evil-shift-width 2)
  (define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)
  (setq evil-want-fine-undo nil)
  (setq require-final-newline t)
  )
