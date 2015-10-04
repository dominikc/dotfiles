(when (fboundp 'define-fringe-bitmap)
  (define-fringe-bitmap 'my-flycheck-fringe-indicator
    (vector #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00011100
            #b00111110
            #b00111110
            #b00111110
            #b00011100
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b01111111)))

(flycheck-define-error-level 'error
  :overlay-category 'flycheck-error-overlay
  :fringe-bitmap 'my-flycheck-fringe-indicator
  :fringe-face 'flycheck-fringe-error)

(flycheck-define-error-level 'warning
  :overlay-category 'flycheck-warning-overlay
  :fringe-bitmap 'my-flycheck-fringe-indicator
  :fringe-face 'flycheck-fringe-warning)

(flycheck-define-error-level 'info
  :overlay-category 'flycheck-info-overlay
  :fringe-bitmap 'my-flycheck-fringe-indicator
  :fringe-face 'flycheck-fringe-info)

(add-hook 'after-init-hook #'global-flycheck-mode)
(yas-global-mode)

(setq company-idle-delay 0.2
    company-tooltip-limit 10
    company-minimum-prefix-length 1
    company-tooltip-flip-when-above t)
(global-company-mode 1)

; Javascript
; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook
	  (lambda ()
	    (push '("function" . ?λ) prettify-symbols-alist)))

; Ruby
(defun load-ruby-snippets ()
  (yas-activate-extra-mode 'ruby-mode)
  )

(setq rbenv-show-active-ruby-in-modeline nil)
(global-rbenv-mode)
(eval-after-load 'company
                 '(push 'company-robe company-backends))

(add-hook 'ruby-mode-hook 'enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'load-ruby-snippets)
(add-hook 'enhanced-ruby-mode 'inf-ruby-minor-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

; Rspec
(setq rspec-use-rake-when-possible nil)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

; Restclient
(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))

(provide 'init-syntax)
