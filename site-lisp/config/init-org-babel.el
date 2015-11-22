;;把 plantuml 添加到 org-babel-load-languages 加载语言列表里。
(defun org-export-signle-page ()
  (interactive)
  (let ((org-html-head
         (xhtml-css-from-file "~/.emacs.d/resources/org-theme-hy.css"))
        (org-export-show-temporary-export-buffer nil))
    (org-html-export-to-html nil nil nil nil '(:publishing-directory "~"))))

;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))
(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/resources/plantuml.jar"))


(setq org-ditaa-jar-path
      "~/.emacs.d/plugins/ditaa0_9.jar")
;;(setq org-plantuml-jar-path “~/java/plantuml.jar”)

;;(add-hook ‘org-babel-after-execute-hook
;;            ‘org-display-inline-images ‘append)



;;(setq org-directory (vars-get 'org-dir))
;;(setq org-mobile-directory (vars-get 'org-mobile-dir))
;;(setq org-mobile-inbox-for-pull (concat org-directory "/mobile.org"))
(setq org-archive-location "archives/%s_archive::")
;;(setq org-src-fontify-natively t)
;;(setq org-export-publishing-directory (concat (vars-get 'work-dir) "/tmp/org-export"))

;; load basic languages support
(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote (
         (python . t)
         (emacs-lisp . t)
         (awk . t)
         (dot . t)
         (ditaa . t)
         (R . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (sh . t)
         (ledger . t)
         (org . t)
         (plantuml . t)
         (makefile . t)
         (latex . t))))
