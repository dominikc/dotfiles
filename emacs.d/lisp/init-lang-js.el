(maybe-require-package 'js2-mode)

(custom-set-variables '(coffee-tab-width 2))
(maybe-require-package 'literate-coffee-mode)

(defun configure-js2-mode ()
  (setq-default js2-basic-offset 2)
  (js2-mode)
  )

(add-hook 'js-mode-hook'configure-js2-mode)
(provide 'init-lang-js)
