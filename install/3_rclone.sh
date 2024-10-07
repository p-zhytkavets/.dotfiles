#!/usr/bin/env bash

prepare() {
	:
}

drive() {
	MENU_VARIANTS=("Yes" "No")
	PS3="$1"
	menu
	if [[ "$MENU_ANSWER" == "No" ]]; then
		return
	fi

	MENU_VARIANTS=("Yes" "No")
	PS3="Configure is local? "
	menu
	if [[ "$MENU_ANSWER" == "Yes" ]]; then
		rclone config create "$2" "$3" config_is_local=true
	else
		rclone config create "$2" "$3" config_is_local=false
	fi

	systemctl --user enable --now rclone@"$2"
}

install() {
	PS3="Install rclone?"
	MENU_VARIANTS=("Yes" "No") menu
	if [[ "$MENU_ANSWER" == "No" ]]; then
		return
	fi

	sudo curl https://rclone.org/install.sh | sudo bash

	ln -sf "$DOTFILES/systemd/user/rclone@.service" "$HOME/.config/systemd/user/rclone@.service"
	systemctl --user daemon-reload

	drive "Link Google drive?" "gdrive" "drive"
	drive "Link Yandex disk?" "yandex_disk" "yandex"
	drive "Link Microsoft onedrive?" "onedrive" "onedrive"
	drive "Link Dropbox?" "dropbox" "dropbox"
}

if [[ "$1" == "-p" ]]; then
	prepare
elif [[ "$1" == "-i" ]]; then
	install
fi
