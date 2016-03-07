;; http://orgmode.org/worg/org-tutorials/org-latex-export.html
(require 'ox-latex)
;; Org v8 change log:
;; @see http://orgmode.org/worg/org-8.0.html

;; {{ export org-mode in Chinese into PDF
;; @see http://freizl.github.io/posts/tech/2012-04-06-export-orgmode-file-in-Chinese.html
;; and you need install texlive-xetex on different platforms
;; To install texlive-xetex:
;;    `sudo USE="cjk" emerge texlive-xetex` on Gentoo Linux
(setq org-latex-to-pdf-process ;; org v7
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))
(setq org-latex-pdf-process org-latex-to-pdf-process) ;; org v8
;; }}

(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("org-article"
               "\\documentclass{article}
\\usepackage{zhfontcfg}
\\usepackage{indentfirst}
\\usepackage{lineno}
\\usepackage{tabularx}
\\usepackage{fancybox}
\\usepackage{fancyhdr}
\\usepackage{graphicx}
\\usepackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black,CJKbookmarks=True]{hyperref}
\\usepackage[a4paper,left=3cm,right=3cm,top=3cm,bottom=3cm]{geometry}
\\parindent=2em
\\linespread{1.25}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;; 导出Beamer的设置
;; allow for export=>beamer by placing #+LaTeX_CLASS: beamer in org files
;;-----------------------------------------------------------------------------
(add-to-list 'org-latex-classes
             ;; beamer class, for presentations
             '("org-beamer"
               "\\documentclass{beamer}
\\usepackage{zhfontcfg}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"
                "\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}")))


;; 使用Listings宏包格式化源代码(只是把代码框用listing环境框起来，还需要额外的设置)
(setq org-export-latex-listings t)
;; Options for \lset command（reference to listing Manual)
(setq org-export-latex-listings-options
      '(
        ("basicstyle" "\\color{foreground}\\small\\mono")           ; 源代码字体样式
        ("keywordstyle" "\\color{function}\\bfseries\\small\\mono") ; 关键词字体样式
        ("identifierstyle" "\\color{doc}\\small\\mono")
        ("commentstyle" "\\color{comment}\\small\\itshape")         ; 批注样式
        ("stringstyle" "\\color{string}\\small")                    ; 字符串样式
        ("showstringspaces" "false")                                ; 字符串空格显示
        ("numbers" "left")                                          ; 行号显示
        ("numberstyle" "\\color{preprocess}")                       ; 行号样式
        ("stepnumber" "1")                                          ; 行号递增
        ("backgroundcolor" "\\color{background}")                   ; 代码框背景色
        ("tabsize" "4")                                             ; TAB等效空格数
        ("captionpos" "t")                                          ; 标题位置 top or buttom(t|b)
        ("breaklines" "true")                                       ; 自动断行
        ("breakatwhitespace" "true")                                ; 只在空格分行
        ("showspaces" "false")                                      ; 显示空格
        ("columns" "flexible")                                      ; 列样式
        ("frame" "single")                                          ; 代码框：阴影盒
        ("frameround" "tttt")                                       ; 代码框： 圆角
        ("framesep" "0pt")
        ("framerule" "8pt")
        ("rulecolor" "\\color{background}")
        ("fillcolor" "\\color{white}")
        ("rulesepcolor" "\\color{comdil}")
        ("framexleftmargin" "10mm")
        ))
(setq ps-paper-type 'a4
      ps-font-size 16.0
      ps-print-header nil
      ps-landscape-mode nil)

;; 公式
(setq org-export-with-LaTeX-fragments t)
;; 修改这个变量改大小
;;org-format-latex-options

(defcustom org-format-latex-options
  '(:foreground default :background default :scale 2.0
                     :html-foreground "Black" :html-background "Transparent" :html-scale 2.0
                     :matchers ("begin" "$1" "$" "$$" "\\(" "\\["))
     "Options for creating images from LaTeX fragments.
This is a property list with the following properties:
:foreground  the foreground color for images embedded in Emacs, e.g. \"Black\".
              `default' means use the foreground of the default face.
:background  the background color, or \"Transparent\".
              `default' means use the background of the default face.
:scale       a scaling factor for the size of the images.
:html-foreground, :html-background, :html-scale
              the same numbers for HTML export.
:matchers    a list indicating which matchers should be used to
              find LaTeX fragments.  Valid members of this list are:
              \"begin\"  find environments
              \"$1\"     find single characters surrounded by $.$
              \"$\"      find math expressions surrounded by $...$
              \"$$\"     find math expressions surrounded by $$....$$
              \"\\(\"     find math expressions surrounded by \\(...\\)
              \"\\ [\"    find math expressions surrounded by \\ [...\\]"
        :group 'org-latex
        :type 'plist) 

(provide 'init-org-tex)
