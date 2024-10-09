#!/usr/bin/env bash

prepare() {
  INSTALL_PACKAGES+=('zsh' 'curl' 'exa' 'fzf' 'btop')
}

install() {
  # antigen
  if [ ! -d "$ZDOTDIR" ]; then
    mkdir -p "$ZDOTDIR"
  fi

  if [ ! -d "$ZDOTDIR/plugins" ]; then
    mkdir -p "$ZDOTDIR/plugins"
  fi

  cd "$ZDOTDIR/plugins" && {
    curl -L git.io/antigen >antigen.zsh
    cd -
  }

  ln -sf "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
  ln -sf "$DOTFILES/zsh/.zshrc" "$ZDOTDIR/.zshrc"

  PS3="Set zsh default?"
  MENU_VARIANTS=("Yes" "No")
  menu
  if [[ "$MENU_ANSWER" == "Yes" ]]; then
    stop_log
    sudo chsh -s $(which zsh)
    start_log
  fi
  echo 123
}

if [[ "$1" == "-p" ]]; then
  prepare
elif [[ "$1" == "-i" ]]; then
  install
fi
