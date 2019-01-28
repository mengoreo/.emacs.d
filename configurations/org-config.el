(use-package org-bullets
	:init
	:load-path "~/.emacs.d/packages/org-bullets/"
	)

(use-package org
	:ensure t

	:init
	(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
	(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))

	:config
	(setq org-src-fontify-natively t)
	(setq org-export-backends (quote (ascii html icalendar pdflatex latex md odt)))
	(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2018/bin/x86_64-darwin"))
	(setq org-babel-python-command "/opt/local/bin/python")
	(org-babel-do-load-languages
	 'org-babel-load-languages
	 '(
	   (python .t)
	   (C . t)
	   ;; (plantuml . t)
	   ))
	(setq org-plantuml-jar-path
		  (expand-file-name "~/.emacs.d/packages/plantuml.jar")
		  )

	:bind (
		   ("C-s-h" . org-babel-hide-result-toggle)
		   ("<C-s-268632072>" . org-babel-hide-result-toggle)
		   )
	)
(provide 'org-config)
