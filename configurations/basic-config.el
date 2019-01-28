;;; package --- summary
;;; Commentary:
;;; Code:
(eval-when-compile
	(unless (package-installed-p 'use-package)
		(package-refresh-contents)
		(packag-install 'use-package))
	(require 'use-package))

(use-package shell-current-directory)
(use-package google-this
	:config
	(google-this-mode +1)
	)
(use-package htmlize)
(use-package yaml-mode)
(use-package restart-emacs)
(use-package git)
(use-package esxml)
(use-package super-save
	:ensure t
	:config
	(super-save-mode +1))
;; (use-package flycheck
;; 	:config
;; 	(flycheck-mode t)
;; 	)
(use-package project-explorer)
(use-package auto-complete
	:config
	(ac-config-default)
	(setq ac-use-menu-map t)
	)
(use-package dropdown-list
	:load-path "~/.emacs.d/packages/dropdown-list"
	:config
	(setq yas-prompt-functions '(yas-dropdown-prompt
                                   yas-ido-prompt
                                   yas-completing-prompt))
	)

(use-package yasnippet
	:load-path "~/.emacs.d/packages/yasnippet"
	:config
	;; (setq yas-trigger-key (kbd "TAB"))
	(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
	(yas-global-mode t)
	)

(use-package restart-emacs
	:ensure t
	)
;; (use-package emaXcode
;; 	:load-path "~/.emacs.d/packages/emaXcode"
;; 	)
;; (use-package flymake
	
	;; :config
	;; (flymake-mode t)
	;; )
;; (use-package pdf-tools
	;; :magic ("%PDF" . pdf-view-mode)
	;; :config
	;; (df-tools-install)
	;; )

(use-package package
  ;; customize
  :config
  ;; (cd "~/Desktop/")
  ;; indent size
  ;; (setq custom-buffer-indent 4)
  (add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
  (setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
  (setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH")))
  (setq exec-path (append exec-path '("/opt/local/bin")))
  (setq initial-scratch-message ";; Welcome back, Mengoreo.
;; Happy coding.
;;

"
)
  ;; my info
  (setq user-full-name "Ethan Mengoreo"
		user-mail-address "mengoreo@163.com"
		user-name "Mengoreo"
		
	;;calendar-latitude 37.4
	;;calendar-longitude -122.1
	;;calendar-location-name "Mountain View, CA"
	)

  ;; theme settings
  (if (display-graphic-p) ; GUI
      (progn
	(setq initial-frame-alist
	      '(
		(tool-bar-lines . 0) ; disable tool bar
		(width . 106) ; chars
		(height . 60) ; lines
					;(background-color . "honeydew")
		(font . "Menlo-14")
		(left . 609)
		(top . 0)
		))
	(setq default-frame-alist
	      '(
		(tool-bar-lines . 0)
		(width . 106)
		(height . 60)
					;(background-color . "honeydew")
		(font . "Menlo-14")
		(left . 509)
		(top . 0)
		)))
    (progn ; terminal
      (setq initial-frame-alist '( (tool-bar-lines . 0)))
      (setq default-frame-alist '( (tool-bar-lines . 0)))))

  ;; highlight current line
  (global-hl-line-mode t)
  (global-linum-mode t)
  ;; always create a new buffer
  (setq confirm-nonexistent-file-or-buffer nil)
  ;; tab width
  (setq-default tab-width 4)

  ;; yes or no to y or n
  (defalias 'yes-or-no-p 'y-or-n-p)
  
  (setq c-basic-offset 4)
  (setq custom-buffer-indent 4)
  (setq python-indent-guess-indent-offset t)
  (setq python-indent-guess-indent-offset-verbose nil)
  (setq lisp-body-indent 4)

  '(ansi-color-names-vector
    ["#21252B" "#E06C75" "#98C379" "#E5C07B" "#61AFEF" "#C678DD" "#56B6C2" "#ABB2BF"])

  ;; inhibit startup screen
  (setq inhibit-startup-screen t)

  ;; swap meta and super for emacs-mac
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super)
  )


(provide 'basic-config)
