#!/usr/bin/env bash

prepare() {
	INSTALL_PACKAGES+=('pip' 'git')
}

install() {
	# remove duplicates
	packs=$(
		IFS=$' '
		echo "${INSTALL_PACKAGES[*]}" | tr ' ' '\n' | sort -u | tr '\n' ' '
	)

	PS3="Use DNF or UPT? "
	MENU_VARIANTS=("DNF" "UPT")
	menu
	if [ "$MENU_ANSWER" == "DNF" ]; then
		sudo dnf "$packs"
	else
		sudo dnf "$packs"
	fi
}

if [[ "$1" == "-p" ]]; then
	prepare
elif [[ "$1" == "-i" ]]; then
	install
fi
