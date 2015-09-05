(global-flycheck-mode)
(yas-global-mode)

(setq company-idle-delay 0.2
    company-tooltip-limit 10
    company-minimum-prefix-length 1
    company-tooltip-flip-when-above t)
(global-company-mode 1)

; Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook
	  (lambda ()
	    (push '("function" . ?λ) prettify-symbols-alist)))

; Ruby
(defun load-ruby-snippets ()
  (yas-activate-extra-mode 'ruby-mode)
  )

(setq rbenv-modeline-function 'rbenv--modeline-plain)
(global-rbenv-mode)
(eval-after-load 'company
                 '(push 'company-robe company-backends))

(add-hook 'ruby-mode-hook 'enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'load-ruby-snippets)
(add-hook 'enhanced-ruby-mode 'inf-ruby-minor-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(provide 'init-syntax)
