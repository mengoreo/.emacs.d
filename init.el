;; init.el with use-package

;; Copyright (C) 2018 Mengoreo 

;; Author: Mengoreo <mengoreo@163.com>
(require 'package)


(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/configurations")
(package-initialize)

(setq shell-file-name "/bin/bash")
(require 'cc-mode)
(require 'basic-config)
(require 'elpy-config)
(require 'org-config)
;; (require 'evil-config)
(require 'ivy-config)
(require 'bindings-config)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(org-hugo-auto-set-lastmod t)
 '(package-selected-packages
   (quote
	(easy-hugo smex ox-hugo openwith anzu terminal-here sublime-themes google-this super-save yasnippet-snippets yaml-mode use-package shell-current-directory restart-emacs project-explorer pdf-tools org-bullets htmlize helm-core evil esxml elpy counsel auto-yasnippet auto-org-md auto-complete)))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote mailclient-send-it))
 '(smtpmail-smtp-server "smtp.163.com")
 '(smtpmail-smtp-service 25))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(hl-line ((t (:inherit bold)))))


	
