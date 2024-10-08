#!/usr/bin/env bash

default="\033[39m"
red="\033[0;31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"

log_file=log
# CONFIG_DIR=~/.config
export INSTALL_PACKAGES=()

start() {
	stop_log
	echo -e -n "${blue}${1} ${yellow}${2}${default}"
	start_log
}

end() {
	stop_log
	if [ "$?" -ne 0 ]; then
		echo -e "${red} Error${default}"
	else
		echo -e "${green} OK${default}"
	fi
	start_log
}

install_units() {
	#LC_COLLATE=C for ASCII sort files
	for file in $(LC_COLLATE=C ls ./install/); do
		install_unit "$file"
	done
}

prepare_units() {
	#LC_COLLATE=C for ASCII sort files
	for file in $(LC_CLLATE=C ls ./install/); do
		prepare_unit "$file"
	done
}

prepare_unit() {
	start "Prepare" "$1"
	source "./install/$1" -p
	end
}

install_unit() {
	start "Install" "$1"
	source "./install/$1" -i
	end
}

: >$log_file

function create_sl_to_dir() {
	if [ -L "$1" ]; then
		echo "unlink $1"
		unlink "$1"
	elif [ -d "$1" ]; then
		echo "backup $1 "
		mv $1{,.bak$(date +%s)}
	fi

	echo "create link $1 to $2"
	ln -sf "$2" "$1"
}

function create_config_sl_to_dotdir_dir() {
	create_sl_to_dir "$XDG_CONFIG_HOME"/"$1" "$DOTFILES"/"$2"
}

MENU_ANSWER=""
MENU_VARIANTS=()
menu() {
	stop_log
	tput smcup
	MENU_VARIANTS+=("Quit")
	select MENU_ANSWER in "${MENU_VARIANTS[@]}"; do
		if [[ "$MENU_ANSWER" == "Quit" ]]; then
			tput rmcup
			exit
		fi
		for item in "${MENU_VARIANTS[@]}"; do
			if [[ "$item" == "$MENU_ANSWER" ]]; then
				break 2
			fi
		done
		echo "invalid option $REPLY"
	done
	tput rmcup
	start_log
}

config_sudoers() {
	PS3="Configure sudoers? "
	MENU_VARIANTS=("Yes" "No")
	menu
	if [[ "$MENU_ANSWER" == "Yes" ]]; then
		PS3="NOPASSWD?"
		MENU_VARIANTS=("Yes" "No")
		menu
		if [[ "$MENU_ANSWER" == "Yes" ]]; then
			echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo
		else
			echo "$USER ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo
		fi
	fi
}

NOLOG=false
start_log() {
	if [ "$NOLOG" == "false" ]; then
		exec 3>&1 4>&2
		exec >>$log_file 2>&1
	fi
}

stop_log() {
	if [ "$NOLOG" == "false" ]; then
		exec >&3 2>&4
	fi
}

. ./zsh/.zshenv

MODE=""
UNIT=""
while [[ "$#" -gt 0 ]]; do
	case $1 in
	-u | --unit)
		MODE="UNIT"
		UNIT="$2"
		shift
		;;
	-n | --nolog)
		NOLOG=true
		;;
	*)
		echo "Unknown parameter passed: $1"
		exit 1
		;;
	esac
	shift
done
start_log
if [[ "$MODE" == "UNIT" ]]; then
	prepare_unit "$UNIT"
	install_unit "$UNIT"
else
	config_sudoers
	prepare_units
	install_units
fi

# git clone https://github.com/tmux-plugins/tpm $CONFIG_DIR/tmux/plugins/tpm

# pip install --user tmuxp
