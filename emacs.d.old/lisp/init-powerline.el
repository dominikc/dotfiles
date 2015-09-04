(when (and (maybe-require-package 'powerline)
           (maybe-require-package 'powerline-evil))

  (setq powerline-default-separator (if (display-graphic-p) 'arrow
                                      nil))

  (powerline-evil-center-color-theme)
  )
(provide 'init-powerline)
