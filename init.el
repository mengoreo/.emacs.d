;; init.el with use-package

;; Copyright (C) 2018 Mengoreo 

;; Author: Mengoreo <mengoreo@163.com>
(require 'package)


(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/configurations")
(package-initialize)

(require 'cc-mode)
(require 'basic-config)
(require 'elpy-config)
(require 'org-config)
;; (require 'evil-config)
(require 'ivy-config)
(require 'bindings-config)
(require 'autoinsert-config)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(google-this super-save yasnippet-snippets yaml-mode use-package shell-current-directory restart-emacs project-explorer pdf-tools org-bullets htmlize helm-core git evil esxml elpy counsel auto-yasnippet auto-org-md auto-complete)))
 '(scroll-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:inherit bold)))))


	
