(defun EM/edit-config ()
    "find my config"
    (interactive)
    (find-file "~/.emacs.d/init.el")
    )
(defun EM/run-python()
	(interactive)
	;; Switch to `*shell*'
	;;(save-excursion
	;; Switch to current buffer
	;;(set-buffer (buffer-name))
	(set 'name (buffer-name))
	;; )
	(save-buffer) ;; save file
	(shell-current-directory)
	;; Goto last prompt, clear old input if any, and insert new one
	(goto-char (point-max))
	(comint-kill-input) 
	(insert (concat "/opt/local/bin/python " name))
	;; Execute
	(comint-send-input)
	(comint-kill-input)
	)


(defun EM/run-c()
	(interactive)
	;; Switch to `*shell*'
	;;(save-excursion
	;; Switch to current buffer
	;;(set-buffer (buffer-name))
	(set 'name (buffer-name))
	;; )
	(save-buffer)
	(shell-current-directory)
	;; Goto last prompt, clear old input if any, and insert new one
	(goto-char (point-max))
	(comint-kill-input)
	(insert (concat "gcc " name " && ./a.out"))
	;; Execute 
	(comint-send-input)
	(set-buffer name)
	)

;; (defun my-run-m()
;; 	(interactive)
;; 	(set 'name (buffer-name))

;; 	(save-buffer)
;; 	(shell-current-directory)
;; 	(goto-char (point-max))
;; 	(comint-kill-input)
;; 	(insert (concat "clang -framework Foundation " name " && ./a.out"))

;; 	(comint-send-input)
;; 	(set-buffer name))

(global-set-key (kbd "<C-s-268632079>") 'other-window)
(global-set-key (kbd "C-s-o") 'other-window)
(global-set-key (kbd "<C-s-268632077>") 'delete-other-windows)
(global-set-key (kbd "C-s-m") 'delete-other-windows)
(global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-s-f") 'toggle-frame-fullscreen)
(global-set-key (kbd "<C-s-268632067>") 'EM/edit-config)
(global-set-key (kbd "C-s-c") 'EM/edit-config)
;; (global-set-key (kbd "<C-s-268632069>") 'eval-buffer)
(global-set-key (kbd "C-c C-b") 'eval-buffer)
(global-set-key (kbd "<C-s-268632083>") 'shell-current-directory)
(global-set-key (kbd "C-s-s") 'shell-current-directory)
(global-set-key (kbd "<C-s-268632080>") 'project-explorer-toggle)
(global-set-key (kbd "C-s-p") 'project-explorer-toggle)
(global-set-key (kbd "<C-s-268632066> n") 'next-buffer)
(global-set-key (kbd "C-s-b n") 'next-buffer)
(global-set-key (kbd "<C-s-268632066> p") 'previous-buffer)
(global-set-key (kbd "C-s-b p") 'previous-buffer)
(global-set-key (kbd "<C-s-268632066> b") 'switch-to-buffer)
(global-set-key (kbd "C-s-b b") 'switch-to-buffer)
(global-set-key (kbd "C-s-x") 'counsel-M-x)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-c C-r") 'restart-emacs)
(define-key python-mode-map (kbd "<C-s-268632069>") 'EM/run-python)
(define-key python-mode-map (kbd "C-s-e") 'EM/run-python)
(define-key c-mode-base-map (kbd "<C-s-268632069>") 'EM/run-c)
(define-key c-mode-base-map (kbd "C-s-e") 'EM/run-c)


;; ivy-config
;; org-config
(provide 'bindings-config)
