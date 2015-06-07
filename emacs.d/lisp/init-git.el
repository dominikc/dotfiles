(setq magit-last-seen-setup-instructions "1.4.0")
(when (maybe-require-package 'magit)
  (evil-leader/set-key
    "gb" 'magit-blame-mode
    "gl" 'magit-log
    "gs" 'magit-status
    "gC" 'magit-commit)
  )


(when (maybe-require-package 'git-gutter-fringe)
  (global-git-gutter-mode)
  )
(provide 'init-git)
