(maybe-require-package 'enh-ruby-mode)
(maybe-require-package 'robe)
(maybe-require-package 'ruby-tools)
(maybe-require-package 'yaml-mode)
(maybe-require-package 'bundler)
(when (maybe-require-package 'rbenv)
  (global-rbenv-mode))

(defun configure-ruby-mode ()
  (robe-mode)
  (enh-ruby-mode)
  (evil-leader/set-key-for-mode 'enh-ruby-mode "mgg" 'robe-jump)
  )

(add-hook 'ruby-mode-hook 'configure-ruby-mode)

(add-hook 'enhanced-ruby-mode 'inf-ruby-minor-mode)
(require-package 'yaml-mode)
(provide 'init-lang-ruby)
