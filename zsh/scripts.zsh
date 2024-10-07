
insert_sudo () { zle beginning-of-line; zle -U "sudo " }

remove_first_word () { zle beginning-of-line; zle delete-word }

# fuzzy explorer
# extending Phantas0's work (https://thevaluable.dev/practical-guide-fzf-example/)
function fex() {

  local selection=$(find -type d | fzf --multi --print0 \
  --preview='tree -C {}' \
  --prompt="$(echo "$PWD(Dirs)")" \
  --bind='del:execute(rm -ri {+})' \
  --bind='ctrl-p:toggle-preview' \
  --bind='ctrl-i:reload(find {} -type d)' \
  --bind='ctrl-k:become(echo "..")' \
  --bind='ctrl-d:change-prompt(Dirs > )' \
  --bind='ctrl-d:+reload(find -type d)' \
  --bind='ctrl-d:+change-preview(tree -C {})' \
  --bind='ctrl-d:+refresh-preview' \
  --bind='ctrl-f:change-prompt(Files > )' \
  --bind='ctrl-f:+reload(find -type f)' \
  --bind='ctrl-f:+change-preview(batcat --style numbers,changes --color=always {} | head -500)' \
  --bind='ctrl-f:+refresh-preview' \
  --bind='ctrl-a:select-all' \
  --bind='ctrl-x:deselect-all' \
  --bind 'ctrl-h:deselect' \
  --bind 'ctrl-l:select' \
  --border-label ' fzf Explorer ' \
  --header ' CTRL-D (directories) CTRL-F (files)
 CTRL-A (select all) CTRL-X (deselect) 
 CTRL-P (toggle preview) DEL (delete)' 
  )

  # if no selection made do nothing
  if [ -z "$selection" ]; then
    return 0
  fi

  # if selection is a folder (with multiples go to the first)
  if [ -d "$(echo $selection | sed 's/\x0.*$//')" ]; then
    cd "$selection"
    fex
  else
    # supports multiple selections
    eval $EDITOR $(echo $selection |sed -e 's/\x00/ /g')
  fi
}
