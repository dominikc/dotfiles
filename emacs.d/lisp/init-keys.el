(add-hook 'flycheck-mode-hook
          (lambda ()
            (evil-define-key 'normal flycheck-mode-map (kbd "]e") 'flycheck-next-error)
            (evil-define-key 'normal flycheck-mode-map (kbd "[e") 'flycheck-previous-error)))

; (evil-define-key 'normal (kbd "[b") 'switch-to-prev-buffer)
; (evil-define-key 'normal (kbd "]b") 'switch-to-next-buffer)
(provide 'init-keys)
