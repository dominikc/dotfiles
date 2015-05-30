;; -*- mode: dotspacemacs -*-
;; vim: ft=lisp

(defun dotspacemacs/layers ()
  (setq-default
    dotspacemacs-configuration-layer-path '()
    dotspacemacs-configuration-layers '(
                                         auto-completion syntax-checking
                                         colors themes-megapack org
                                         evil-commentary vim-empty-lines
                                         editorconfig restclient osx vagrant
                                         (git :variables git-gutter-use-fringe t)
                                         c-c++ html javascript ruby
                                         )
    dotspacemacs-excluded-packages '()
    dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
    dotspacemacs-themes '(monokai leuven material gruvbox zenburn)
    dotspacemacs-default-font '("Fira Mono"
                                :size 13
                                :weight normal
                                :width normal
                                :powerline-scale 1.1)

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
  )
