;; -*- mode: dotspacemacs -*-
;; vim: ft=lisp

(defun dotspacemacs/layers ()
  (setq-default
    dotspacemacs-configuration-layer-path '()
    dotspacemacs-configuration-layers '(
                                         auto-completion
                                         colors
                                         editorconfig
                                         evil-commentary
                                         (git :variables
                                           git-gutter-use-fringe t)
                                         javascript
                                         restclient
                                         ruby
                                         osx
                                         tmux
                                         syntax-checking
                                         themes-megapack
                                         vagrant
                                         )
    dotspacemacs-excluded-packages '()
    dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
    dotspacemacs-themes '(monokai gruvbox zenburn)

    ruby-enable-ruby-on-rails-support t
    ruby-version-manager 'rbenv

    require-final-newline t
    evil-want-fine-undo nil
    evil-shift-width 2
    projectile-enable-caching nil
    )
  )

(defun dotspacemacs/config ()
  (global-linum-mode)
  (linum-relative-toggle)
  )
