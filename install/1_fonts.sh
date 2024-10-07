#!/usr/bin/env bash

prepare() {
	INSTALL_PACKAGES+=('curl')
}

install() {
	mkdir -p ~/.config/local/share/fonts
	cd ~/.config/local/share/fonts && {
		curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
		cd -
	}
	fc-cache -f -v
}

if [[ "$1" == "-p" ]]; then
	prepare
elif [[ "$1" == "-i" ]]; then
	install
fi
