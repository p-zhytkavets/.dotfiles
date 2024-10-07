#!/usr/local/bin/zsh

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache
export DOTFILES="$HOME/.dotfiles"
export WORKSPACE="$HOME/workspace"

#editor
export EDITOR="nvim"
export VISUAL="nvim"

#zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export TMUXP_CONFIGDIR="$XDG_CONFIG_HOME/tmuxp"

# History
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000000
export SAVEHIST=10000000

#tmux
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOSTART_ONCE=false

#
export PATH="$HOME/.local/bin:$PATH"

# Man pages
export MANPAGER='nvim +Man!'

# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'
# alias vi=nvim

# fzf
#export FZF_DEFAULT_COMMAND='rg --files --ignore-file=~/.zshignore --hidden --glob "!.git"'
# export FZF_DEFAULT_COMMAND='rg --files'
#export FZF_ALT_C_COMMAND='fd --hidden --type d --follow --exclude ".git"'
# export FZF_ALT_C_COMMAND='fd --type d --follow'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#alias -s txt=vim

# FZF_COLORS="bg+:-1,\
# fg:gray,\
# fg+:white,\
# border:black,\
# spinner:0,\
# hl:yellow,\
# header:blue,\
# info:green,\
# pointer:red,\
# marker:blue,\
# prompt:gray,\
# hl+:red"
#
# export FZF_DEFAULT_OPTS="--height 70% \
# --border sharp \
# --layout reverse \
# --color '$FZF_COLORS' \
# --prompt '∷ ' \
# --pointer ▶ \
# --marker ⇒ \
# --bind 'ctrl-p:toggle-preview'
# --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
# --bind 'ctrl-e:execute(nvim {}  > /dev/tty)+abort'
# --bind 'ctrl-o:execute(code {+})+abort'
#     --bind=ctrl-a:toggle-all
#     --bind=ctrl-d:preview-page-down
#     --bind=ctrl-u:preview-page-up
#     --bind=alt-bs:clear-query
#     --bind=ctrl-h:deselect
#     --bind=ctrl-l:select"
#
# export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 30'"
#export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"
#
# #export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(nvim {})+abort'"
# #export FZF_DEFAULT_OPTS="--bind='ctrl-o:(nvim {})'"
# export FZF_CTRL_T_OPTS="--preview-window 'right:90%' --preview 'bat --color=always --style=header,grid --line-range :3000 {}'"
#
# # Use fd (https://github.com/sharkdp/fd) instead of the default find
# # command for listing path candidates.
# #_fzf_compgen_path() {
# #  #fd --hidden --follow --exclude ".git" . "$1"
# #  echo 11
# #}
#
# # Use fd to generate the list for directory completion
# #_fzf_compgen_dir() {
# #  fd --type d --hidden --follow --exclude ".git" . "$1"
# #}
