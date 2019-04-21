(use-package counsel)
(use-package ivy
	:config
	(ivy-mode t)
	:init
	(setq ivy-use-virtual-buffers t)
	(setq ivy-count-format "(%d/%d) ")
	:bind (
		   ;; standard commands
		   ("C-s" . swiper)
		   ("M-x" . counsel-M-x)
		   ("C-x C-f" . counsel-find-file)
		   ("C-h f" . counsel-describe-function)
		   ("C-h v" . counsel-describle-variable)
		   ("<f1> l" . counsel-find-library)
		   ("<f1> i" . counsel-info-lookup-symbol)
		   ("<f2> u" . counsel-unicode-char)

		   ;; shell and system commands
		   ("C-c g" . counsel-git)
		   ("C-c j" . counsel-git-grep)
		   ("C-c k" . counsel-ag)
		   ("C-x l" . counsel-locate)
		   ;; ("C-S-o" . counsel-rhythmbox)

		   ;; resume and other commands
		   ("C-c C-r" . ivy-resume)
		   )
	)

(provide 'ivy-config)
