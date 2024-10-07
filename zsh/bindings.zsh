# alt+s insert sudo to begin of line
zle -N insert-sudo insert_sudo
zle -N remove-first-word remove_first_word
zle -N wfex fex
bindkey -M viins "^[s" insert-sudo
bindkey -M viins "^[d" remove-first-word
bindkey -M viins "^[f" wfex

#home begin
bindkey -M viins '^[[1~' beginning-of-line
bindkey -M viins '^[[4~' end-of-line
