;; -*- mode: dotspacemacs -*-
;; vim: ft=lisp

(defun dotspacemacs/layers ()
  (setq-default
    dotspacemacs-configuration-layer-path '()
    dotspacemacs-configuration-layers '(
                                         auto-completion smex syntax-checking
                                         colors themes-megapack
                                         evil-commentary vim-empty-lines
                                         editorconfig restclient
                                         (git :variables git-gutter-use-fringe t)
                                         osx vagrant
                                         c-c++ html javascript ruby
                                         )
    dotspacemacs-excluded-packages '()
    dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
    dotspacemacs-themes '(material monokai leuven gruvbox zenburn)

    ruby-enable-ruby-on-rails-support t
    ruby-version-manager 'rbenv

    require-final-newline t
    evil-want-fine-undo nil
    truncate-lines 1
    evil-shift-width 2
    )
  )

(defun dotspacemacs/config ()
  (setq powerline-default-separator nil)
  (global-linum-mode)
  (global-auto-complete-mode)
  (global-aggressive-indent-mode)
  (linum-relative-toggle)
  (spacemacs/toggle-golden-ratio)
  )
