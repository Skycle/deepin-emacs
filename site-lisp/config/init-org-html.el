;; html export settings for V8.*
;;(setq org-html-validation-link nil)
(setq org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\" />")
(setq org-html-head-include-default-style nil)

(defadvice org-html-paragraph (before org-html-paragraph-advice
                                      (paragraph contents info) activate)
  "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to html."
  (let* ((orig-contents (ad-get-arg 1))
         (reg-mb "[[:multibyte:]]")
         (fixed-contents (replace-regexp-in-string
                          (concat "\\(" reg-mb
                                  "\\) *\n *\\(" reg-mb "\\)")
                          "\\1\\2" orig-contents)))
    (ad-set-arg 1 fixed-contents)))
;; load extra languages support
(if (vars-get 'org-babel-lang-extra)
    (org-babel-do-load-languages
     'org-babel-load-languages
     (vars-get 'org-babel-lang-extra)))

(defun org-export-signle-page ()
  (interactive)
  (let ((org-html-head
         (xhtml-css-from-file "~/.emacs.d/resources/org-theme-hy.css"))
        (org-export-show-temporary-export-buffer nil))
    (org-html-export-to-html nil nil nil nil '(:publishing-directory "~/publis_html/"))))

(let ((kdr2-com-output-dir (app-file "output/"))
      (kdr2-com-source-dir (app-file "org-src")))
  (setq org-publish-project-alist
        `(("kdr2-com-org"
           :base-directory ,kdr2-com-source-dir
           :base-extension "org"
           :publishing-directory ,kdr2-com-output-dir
           :recursive t
           :publishing-function (org-html-publish-to-html)
           :html-head-extra ,kdr2-com-html-head-extra
           :html-preamble ,kdr2-com-html-preamble
           :html-postamble ,kdr2-com-html-postamble
           :headline-levels 3
           :auto-preamble t
           :exclude "README.org\\|.*\.inc\.org\\|.*\.tgl.org"
           )
          ("kdr2-com-rss"
           :base-directory ,kdr2-com-source-dir
           :base-extension "org"
           :publishing-directory ,kdr2-com-output-dir
           :publishing-function (org-rss-publish-to-rss)
           :html-link-home "http://kdr2.com/misc/"
           :html-link-use-abs-url t
           :exclude ".*"
           :include ("misc/site-log.org"))
          ("kdr2-com-static"
           :base-directory ,(app-file "static")
           :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
           :publishing-directory ,(concat kdr2-com-output-dir "static/")
           :recursive t
           :publishing-function (org-publish-attachment)
           )
          ("org-notes"
           :base-directory "~/org/"
           :base-extension "org"
           :publishing-directory "~/public_html/"
           :recursive t
           :publishing-function org-html-publish-to-html
           :headline-levels 4             ; Just the default for this project.
           :auto-preamble t
           )
          ("org-static"
           :base-directory "~/org/"
           :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
           :publishing-directory "~/public_html/"
           :recursive t
           :publishing-function org-publish-attachment
           )
          ("org" :components ("org-notes" "org-static"))
          ;;("kdr2-com" :components ("kdr2-com-org" "kdr2-com-rss" "kdr2-com-static"))
          ("kdr2-com" :components ("kdr2-com-rss" "kdr2-com-org" "kdr2-com-static"))
          )))

