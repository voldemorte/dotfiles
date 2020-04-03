.PHONY: install_zsh
install_zsh:
	bin/zsh

.PHONY: prepare_macos
prepare_macos:
	bin/macos

.PHONY: configure_zsh
configure_zsh:
	bin/config_zsh
