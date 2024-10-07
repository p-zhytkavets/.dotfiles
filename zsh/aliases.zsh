# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'
alias vi=nvim
alias vim=nvim



alias d='dirs -v'
for index ({1..9}) alias "$index"="cd -${index} > /dev/null"; unset index

alias -g ...='../..'
alias -g ....='../../..'

# 
# alias ls='ls --color=auto'
# alias l='ls -l'
# alias ll='ls -lahF'
# alias lls='ls -lahFtr'
# alias la='ls -A'
# alias lc='ls -CF'
#
# alias cp='cp -iv'
# alias mv='mv -iv'
# alias rm='rm -iv'
# alias la='ls -alh'
#
# alias grep="grep -P -i --color=auto"
#
# alias dust='du -sh * | sort -hr'
#
# alias pg='ping 8.8.8.8'
#
# alias port="netstat -tulpn | grep"

# general use
alias ls='exa'                                                          # ls
alias l='exa -lbF --git'                                                # list, size, type, git
alias ll='exa -lbGF --git'                                             # long list
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

# specialty views
alias lS='exa -1'                                                              # one column, just names
alias lt='exa --tree --level=2'                                         # tree


#
alias -s txt=vim
