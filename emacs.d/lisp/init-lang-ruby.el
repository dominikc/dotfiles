(maybe-require-package 'enh-ruby-mode)
(maybe-require-package 'robe)
(maybe-require-package 'ruby-tools)
(maybe-require-package 'yaml-mode)
(maybe-require-package 'bundler)
(maybe-require-package 'projectile-rails)
(maybe-require-package 'feature-mode)
(maybe-require-package 'yaml-mode)

(when (maybe-require-package 'rbenv)
  (global-rbenv-mode))

(evil-leader/set-key "rgg" 'robe-jump)
(eval-after-load 'company
                 '(push 'company-robe company-backends))

(add-hook 'ruby-mode-hook 'enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)

(add-hook 'enhanced-ruby-mode 'inf-ruby-minor-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(provide 'init-lang-ruby)
