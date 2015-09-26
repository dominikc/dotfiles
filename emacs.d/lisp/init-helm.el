(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)
(setq helm-split-window-in-side-p t)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-x") 'helm-projectile)

(helm-mode 1)

(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)
(define-key helm-map (kbd "C-h") 'helm-next-source)
(define-key helm-map (kbd "C-l") 'helm-previous-source)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)

(provide 'init-helm)
