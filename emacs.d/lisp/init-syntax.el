(defun configure-js2-mode ()
  (yas-activate-extra-mode 'js-mode)
  (setq-default js2-basic-offset 2)
  (js2-mode)
  )

(add-hook 'js2-mode-hook
	  (lambda ()
	    (push '("function" . ?λ) prettify-symbols-alist)))

(add-hook 'js-mode-hook'configure-js2-mode)

  (global-rbenv-mode)

(eval-after-load 'company
                 '(push 'company-robe company-backends))

(yas-global-mode)

(defun load-ruby-snippets ()
  (yas-activate-extra-mode 'ruby-mode)
  )

(add-hook 'ruby-mode-hook 'enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'load-ruby-snippets)


(add-hook 'enhanced-ruby-mode 'inf-ruby-minor-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(provide 'init-syntax)
