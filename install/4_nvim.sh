#!/usr/bin/env bash

prepare() {
	INSTALL_PACKAGES+=('nvim')
}

install() {
	create_config_sl_to_dotdir_dir nvim nvim
	# if [ -L "$XDG_CONFIG_HOME/nvim" ]; then
	# 	echo "unlink $XDG_CONFIG_HOME/nvim"
	# 	unlink "$XDG_CONFIG_HOME/nvim"
	# elif [ -d "$XDG_CONFIG_HOME/nvim" ]; then
	# 	echo "backup $XDG_CONFIG_HOME/nvim "
	# 	mv $XDG_CONFIG_HOME/nvim{,.bak$(date +%s)}
	# fi
	#
	# echo "ln -sf $DOTFILES/nvim $XDG_CONFIG_HOME/nvim"
	# ln -sf "$DOTFILES/nvim" "$XDG_CONFIG_HOME/nvim"
}

if [[ "$1" == "-p" ]]; then
	prepare
elif [[ "$1" == "-i" ]]; then
	install
fi
