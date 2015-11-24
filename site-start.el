(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/deepin-emacs/site-lisp/")
(add-subdirs-to-load-path "~/.emacs.d/elpa/")
(setq yas-snippet-dirs "~/deepin-emacs/snippets/")
(require 'init)
;; 个人设置
(require 'init-skycle)
;; (global-set-key (kbd "\C-h") 'delete-backward-char)

