(setq evil-want-C-u-scroll t)
(setq-default evil-want-fine-undo nil)
(setq-default evil-shift-width 2)

(when (maybe-require-package 'evil-leader)
  (global-evil-leader-mode)
  (evil-leader/set-leader "\\")
  (setq evil-leader/in-all-states 1)
  )

(when (maybe-require-package 'evil-commentary)
  (evil-commentary-mode))

(when (maybe-require-package 'evil-surround)
  (global-evil-surround-mode))

(maybe-require-package 'evil-indent-textobject)

(when (maybe-require-package 'evil)
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "C-S-P") 'helm-projectile-switch-project)
  (define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)
  (define-key evil-normal-state-map (kbd "-") 'helm-find-files)
  )


(provide 'init-evil)
