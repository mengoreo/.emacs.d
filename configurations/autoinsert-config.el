
(auto-insert-mode)  ;;; Adds hook to find-files-hook
(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion

(eval-after-load 'autoinsert
  '(define-auto-insert '("\\.c\\'" . "C skeleton")
     '(
       "Short description: "
       "/**\n * "
       (file-name-nondirectory (buffer-file-name))
       " -- " str \n
       " *" \n
       " * Written on " (format-time-string "%A, %e %B %Y.") \n
       " */" > \n \n
       "#include <stdio.h>" \n
       "#include \""
       (file-name-sans-extension
        (file-name-nondirectory (buffer-file-name)))
       ".h\"" \n \n
       "int main()" \n
       "{" > \n
       > _ \n
       "}" > \n)))

(defun EM/org-template ()
	(insert
	 "#+LaTeX_HEADER: \\usepackage{CJK}
#+LaTeX_HEADER: \\begin{CJK}{UTF8}{gbsn}
#+TITILE:   
#+AUTHOR:   Ethan Mengoreo
#+EMAIL:    edgar.factorial@gmail.com
#+STARTUP:  indent
#+LANGUAGE: en
#+OPTIONS:  toc:nil num:0
#+SETUPFILE: https://fniessen.github.io/org-html-themes/setup/theme-readtheorg.setup
#+LaTeX_HEADER: \\usepackage{indentfirst}")
  (org-mode-restart))

(define-auto-insert "\\.org$" #'EM/org-template)
(provide 'autoinsert-config)
