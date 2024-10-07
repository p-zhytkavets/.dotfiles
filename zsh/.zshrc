# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export FZF_PREVIEW_ADVANCED=false

# You must Install antigen for correct work:
# cd ~/.config/zsh/plugins
# curl -L git.io/antigen > antigen.zsh
source $ZDOTDIR/plugins/antigen.zsh
antigen use oh-my-zsh
antigen bundle Tarrasch/zsh-bd
antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jeffreytse/zsh-vi-mode
antigen bundle unixorn/fzf-zsh-plugin@main
antigen theme romkatv/powerlevel10k
antigen apply


# export FZF_PREVIEW_ADVANCED=false
#jeffreytse/zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
# so that the ctrl+r bindkey is given back fzf
# zvm_after_init_commands+=("bindkey -M viins '^R' fzf-history-widget")
# zvm_after_init_commands+=("source $HOME/.fzf/shell/key-bindings.zsh")
function my_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}
zvm_after_init_commands+=(my_init)

# Navigation
setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHDMINUS

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          #? Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        #? Use extended globbing syntax.


setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.


export FZF_TMP_DIR="/tmp/zsh/$$"

destructor() {
  rm -rf $FZF_TMP_DIR
}

TRAPINT() {
  destructor
}
TRAPQUIT() {
  destructor
}
TRAPTERM() {
  destructor
}
TRAPEXIT() {
  destructor
}


# _comp_options+=(globdots) # With hidden files
source $DOTFILES/zsh/completion.zsh
source $DOTFILES/zsh/scripts.zsh
source $DOTFILES/zsh/aliases.zsh
source $DOTFILES/zsh/bindings.zsh
source $DOTFILES/zsh/fzf.zsh


# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
