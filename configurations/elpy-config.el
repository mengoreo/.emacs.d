(use-package elpy
	:config
	(elpy-enable)
	(setq elpy-rpc-python-command "/opt/local/bin/python")
	(setq elpy-shell-use-project-root nil)
	(setq python-shell-completion-native-enable nil)
	(setq python-shell-interpreter "/opt/local/bin/python")
	)
(provide 'elpy-config)
