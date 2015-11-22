;; http://orgmode.org/worg/org-tutorials/org-latex-export.html
(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("orgarticle"
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
\\linespread{1.25}
\\date{\\today}
\\newpage
\\tableofcontents"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(provoid 'init-org-tex.el)
