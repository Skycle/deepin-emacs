(global-set-key (kbd "\C-h") 'delete-backward-char)
(global-set-key (kbd "\C-x \C-x") 'set-mark-command)
(global-set-key (kbd "M-w") 'copy-region-as-kill)
(emacs-session-restore)

;; c 
(setq c-basic-offset 4)
(setq python-indent-offset 4)
;;(print c-basic-offset)
(setq-default c-basic-offset   4
              tab-width        4
              indent-tabs-mode nil)
(provide 'init-skycle)
