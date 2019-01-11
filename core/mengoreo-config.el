;;; mengoreo-config.el  --- Emacs Mengoreo personal configurations
;;
;; Copyright © 2018 Ethan Mengoreo
;;
;; Author: Ethan Mengoreo <mengoreo@163.com>
;; URL: https://github.com/mengoreo
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; We dispense with most of the point and click UI, reduce the startup noise,
;; configure smooth scolling and a nice theme that's easy on the eyes (zenburn).

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
(setq mac-option-modifier (quote meta))
(setq mac-command-modifier (quote super))
;; (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;; (add-to-list 'default-frame-alist '(ns-appearance . white))

;; initial frame size and position
;; (when window-system (set-frame-size (selected-frame) 93 53))
;; (when window-system (set-frame-size (new-frame) 93 53))
;; (when window-system (set-frame-position (selected-frame) 333 0))

;; longlines words count
;; (setq whitespace-line-column 93)

;; my info
(setq user-full-name "Ethan Mengoreo"
      user-mail-address "mengoreo@163.com"
      user-login-name "Mengoreo")

;; Initial Frame size and font
(if (display-graphic-p) ; GUI
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0) ; disable tool bar
              (width . 106) ; chars
              (height . 60) ; lines
              ;; (background-color . "honeydew")
              (font . "Menlo-14")
              (left . 609)
              (top . 0)
              ))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 106)
              (height . 60)
              ;; (background-color . "honeydew")
              (font . "Menlo-14")
              (left . 509)
              (top . 0)
              )))
  (progn ; terminal
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))

(setq initial-scratch-message ";; Welcome back, Mengoreo.")
;; (setq backup-directory-alist '(("." . "~/emacs_backup_files")))

;; key bindings
(global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-s-f") 'toggle-frame-fullscreen)
;; (global-set-key (kbd "C-?") 'help-command)
;; (global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
;; (global-set-key (kbd "M-h") 'backward-kill-word)
;; (setq mac-option-modifier (quote SUPER))
;; (setq mac-command-modifier (quote SUPER))

(smartparens-global-mode nil)
;; Auto Insert
(auto-insert-mode)  ;;; Adds hook to find-files-hook
(setq auto-insert-directory "~/.emacs.d/templates/") ;;; Or use custom, *NOTE* Trailing slash important
;; (setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
(define-auto-insert "\.py" "em-python-template.py")
;; (define-auto-insert "\.php" "em-php-template.php")
(define-auto-insert "\.org" "em-org-template.org")
(define-auto-insert "\.el" "em-lisp-template.el")


;; syntax highlighting in pdf
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(provide 'mengoreo-config)
;;; mengoreo-config.el ends here
