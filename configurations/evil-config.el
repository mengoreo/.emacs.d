(use-package evil
	:ensure t
	
	:init
	(progn
		(setq evil-want-C-u-scroll t)
		;; Change cursor color depending on mode
		(setq evil-emacs-state-cursor '("red" box)
			  evil-normal-state-cursor '("gray" box)
			  evil-visual-state-cursor '("orange" box)
			  evil-insert-state-cursor '("red" bar)
			  evil-replace-state-cursor '("red" bar)
			  evil-operator-state-cursor '("red" hollow))
		(evil-mode 1))
	
	:config
	(setq evil-insert-state-map (make-sparse-keymap))
	;; my functions
 
	;; keys
	:bind (
		   :map evil-motion-state-map
				("SPC" . nil)
				("SPC SPC" . 'counsel-M-x)
				("SPC f f" . 'counsel-find-file)
				("SPC f s" . 'save-buffer)
				("SPC b b" . 'switch-to-buffer)
				("SPC b p" . 'previous-buffer)
				("SPC b n" . 'next-buffer)
				("SPC b k" . 'kill-current-buffer)
				("SPC w" . 'evil-window-map)
				("SPC q r" . 'restart-emacs)
				("SPC q q" . 'save-buffers-kill-terminal)
				("SPC s" . 'shell-current-directory)
				("SPC e" . 'eww)
				("/" . 'swiper)
				("SPC p e" . 'my-run-python)
				("SPC c e" . 'my-run-c)
				("SPC m e" . 'my-run-m)
				("SPC l" . 'linum-mode)

				:map evil-insert-state-map
				("<escape>" . 'evil-normal-state)

				)
   
   
	)
(provide 'evil-config)
