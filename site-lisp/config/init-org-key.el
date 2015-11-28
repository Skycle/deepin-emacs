(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;; I use C-c c to start capture mode
(global-set-key (kbd "C-c c") 'org-capture)
;; -------------------------------------------------------------------
;; dwliang add @20151008 begin
(global-set-key "\C-cb" 'org-iswitchb)

(provide 'init-org-key)
