(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "C-x b") 'helm-mini)

(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)
(define-key helm-map (kbd "C-h") 'helm-next-source)
(define-key helm-map (kbd "C-l") 'helm-previous-source)
(projectile-global-mode)
(provide 'init-helm)
