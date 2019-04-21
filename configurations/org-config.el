(use-package org-bullets
	:init
	:load-path "~/.emacs.d/packages/org-bullets/"
	)

(use-package org
	:ensure t
		
	:config
	(add-to-list 'auto-mode-alist '("\\.org\\’" . org-mode))
	(add-hook 'org-mode-hook (lambda ()
								 (org-bullets-mode 1)
								 (visual-line-mode 1)
								 (whitespace-mode 0)
								 (flyspell-mode 1)
								 ))

	(add-to-list 'org-structure-template-alist
				 '("ph" "#+TITLE:\n#+AUTHOR:   Ethan Mengoreo\n#+EMAIL:    mengoreo@163.com\n#+LANGUAGE: en\n#+OPTIONS:  html-postamble:nil whn:nil toc:nil nav:nil num:0\n#+SETUPFILE: https://juicyiter.gitee.io/assets/mengoreo.setup\n"))

	(add-to-list 'org-structure-template-alist
				 '("al" "\\begin{align}\n\n\\end{align}"))

	
	(defun update-tag ()
		(interactive)
		(save-excursion
			(goto-char (point-min))
			(let ((count 1))
				(while (re-search-forward "\\tag{\\([0-9]+\\)}" nil t)
					(replace-match (format "%d" count) nil nil nil 1)
					(setq count (1+ count)))))
		)
	(setq org-src-fontify-natively t)
	(setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))
	(setq org-startup-indented t)
	(setq org-html-mathjax-template
          "
<script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS_SVG\"></script>
<script type=\"text/x-mathjax-config;executed=true\">
<!--/*--><![CDATA[/*><!--*/
    MathJax.Hub.Config({
        jax: [\"input/TeX\", \"output/SVG\"],

        displayAlign: \"center\",
        displayIndent: \"0em\",

        \"HTML-CSS\": {
             scale: %SCALE,
             linebreaks: { automatic: \"false\" },
             webFont: \"TeX\"
        },
        SVG: {scale: 100,
              linebreaks: { automatic: \"false\" },
              font: \"TeX\"},
        NativeMML: {scale: 100},
        TeX: { equationNumbers: {autoNumber: \"AMS\"},
               MultLineWidth: \"85%\",
               TagSide: \"right\",
               TagIndent: \".8em\"
             }
    });
/*]]>*///-->
</script>")

	(setq org-html-postamble t)
	(setq org-html-postamble-format
		  '(("en" "<p class=\"author\">Author: <a href=\"https://mengoreo.github.io\">%a</a>
<a href=\"https://github.com/mengoreo\" target=\"_blank\" title=\"GitHub\"><i class=\"fa fa-fw fa-github\"></i></a></p>
<p class=\"postamble\">Last Updated %T.</p>")))


	(setq org-src-fontify-natively t
		  org-confirm-babel-evaluate nil)

	;; syntax highlighting in pdf
	(require 'ox-latex)
	(add-to-list 'org-latex-packages-alist '("" "minted"))


	(setq org-latex-listings 'minted)

	(setq org-latex-pdf-process
		  '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
			"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
			"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

	(setq org-export-backends (quote (ascii html icalendar pdflatex latex md odt)))
	(setenv "PATH" (concat (getenv "PATH") ":/opt/local/libexec/texlive/texbin/"))

	;; GTD
	;; GTD
	(setq org-agenda-files '("/Users/mengoreo/Library/Mobile Documents/com~apple~CloudDocs/org/gtd/inbox.org"
							 "/Users/mengoreo/Library/Mobile Documents/com~apple~CloudDocs/org/gtd/gtd.org"
							 "/Users/mengoreo/Library/Mobile Documents/com~apple~CloudDocs/org/gtd/tickler.org"))
	(setq org-capture-templates '(("t" "Todo [inbox]" entry
								   (file+headline "/Users/mengoreo/Library/Mobile Documents/com~apple~CloudDocs/org/gtd/inbox.org" "Tasks")
								   "* TODO %i%?")
								  ("T" "Tickler" entry
								   (file+headline "/Users/mengoreo/Library/Mobile Documents/com~apple~CloudDocs/org/gtd/tickler.org" "Tickler")
								   "* %i%? \n %U")
								  ))

	(setq org-refile-targets '(("/Users/mengoreo/Library/Mobile Documents/com~apple~CloudDocs/org/gtd/gtd.org" :maxlevel . 1)
							   ("/Users/mengoreo/Library/Mobile Documents/com~apple~CloudDocs/org/gtd/inbox.org" :maxlevel . 1)
							   ("/Users/mengoreo/Library/Mobile Documents/com~apple~CloudDocs/org/gtd/blog.org" :maxlevel . 1)
							   ("/Users/mengoreo/Library/Mobile Documents/com~apple~CloudDocs/org/gtd/someday.org" :level . 1)
							   ("/Users/mengoreo/Library/Mobile Documents/com~apple~CloudDocs/org/gtd/tickler.org" :maxlevel . 1)))

	(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

	;; (setq org-agenda-custom-commands
    ;; '(("o" "" tags-todo "@office"
    ;; ((org-agenda-overriding-header "Office")))))

	(defun my-org-agenda-skip-all-siblings-but-first ()
		"Skip all but the first non-done entry."
		(let (should-skip-entry)
			(unless (org-current-is-todo)
				(setq should-skip-entry t))
			(save-excursion
				(while (and (not should-skip-entry) (org-goto-sibling t))
					(when (org-current-is-todo)
						(setq should-skip-entry t))))
			(when should-skip-entry
				(or (outline-next-heading)
					(goto-char (point-max))))))

	(defun org-current-is-todo ()
		(string= "TODO" (org-get-todo-state)))

	(setq org-babel-python-command "/opt/local/bin/python")
	(org-babel-do-load-languages
	 'org-babel-load-languages
	 '(
	   (python .t)
	   (C . t)
	   (latex . t)
	   (plantuml . t)
	   ))
	(setq org-plantuml-jar-path
		  (expand-file-name "~/.emacs.d/packages/plantuml.jar")
		  )

	;; Screenshot
	(defun my-org-screenshot (basename)
		"Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
		(interactive "sScreenshot name: ")
		(if (equal basename "")
				(setq basename (format-time-string "%Y%m%d_%H%M%S")))
		(setq filename
			  (concat
			   ;; (file-name-directory (buffer-file-name))
			   "/Users/mengoreo/Desktop/MyGitLab/hugo-blog/static/images/"
			   ;; (file-name-base (buffer-file-name))
			   ;; "_"
			   basename
			   ".png"))
		(setq trueLink
			  (concat
			   "/images/"
			   basename
			   ".png"))
		(call-process "screencapture" nil nil nil "-s" filename)
		(insert "#+CAPTION: ")
		;; (insert basename)
		(insert "\n")
		(insert (concat "[[" trueLink "]]"))
		;; (org-display-inline-images)
		)

	(defun org-insert-clipboard-image ()
		;; (interactive "F")
		(interactive)
		(setq dirname (concat "/Users/mengoreo/Desktop/MyGitLab/hugo-blog/static/images/"))
		(setq filename (concat "figure" "_" (format-time-string "%Y%m%d_%H%M%S_") ".png"))
		(setq savename (concat dirname filename))
		(shell-command (concat "pngpaste " savename))
		(if (file-readable-p savename)
				(insert (concat "#+CAPTION: \n[[/images/" filename  "]]\n"))
			(message "Clipboard has no image!")
			)
		;; (org-display-inline-images)
		)

	
	:bind (
		   ("C-s-h" . org-babel-hide-result-toggle)
		   ("<C-s-268632072>" . org-babel-hide-result-toggle)
		   ("C-c s" . my-org-screenshot)
		   ("C-c l" . org-store-link)
		   ("C-c c" . org-capture)
		   ("C-c a" . org-agenda)
		   ("s-y" . org-insert-clipboard-image)
		   )
	)
(provide 'org-config)
