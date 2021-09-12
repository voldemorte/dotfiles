.PHONY: install_zsh
install_zsh:
	bin/zsh

.PHONY: prepare_macos
prepare_macos:
	bin/macos

.PHONY: configure_zsh
configure_zsh:
	bin/config_zsh

.PHONY: configure_vim
configure_vim:
	bin/config_vim

.PHONY: configure_tmux
configure_tmux:
	bin/config_tmux
