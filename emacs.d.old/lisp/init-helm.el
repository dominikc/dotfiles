(when (maybe-require-package 'helm)
  (helm-mode 1)
  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line)
  (define-key helm-map (kbd "C-h") 'helm-next-source)
  (define-key helm-map (kbd "C-l") 'helm-previous-source)
  )

(evil-leader/set-key "/" 'helm-projectile-ag)

(maybe-require-package 'helm-ag)
(maybe-require-package 'helm-themes)

(when (maybe-require-package 'projectile)
  (projectile-global-mode))

(maybe-require-package 'helm-projectile)
(provide 'init-helm)
