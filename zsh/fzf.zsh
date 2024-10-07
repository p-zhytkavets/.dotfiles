export FZF_HIDDEN_ALT_C_COMMAND="fd --follow --hidden --exclude '.git' -t d"
export FZF_NOHIDDEN_ALT_C_COMMAND="fd --follow -t d"

export FZF_HIDDEN_CTRL_T_COMMAND="fd --follow --hidden --exclude '.git'"
export FZF_NOHIDDEN_CTRL_T_COMMAND="fd --follow"

mkdir -p $FZF_TMP_DIR
export ZSH_FSF_HIDDEN_FILE=$FZF_TMP_DIR/fzf_hidden
export ZSH_FSF_DEPH_FILE=$FZF_TMP_DIR/fzf_deph
echo 0 >$ZSH_FSF_HIDDEN_FILE
echo 0 >$ZSH_FSF_DEPH_FILE

export fzf_change_alt_c_depth="
    read is_hidden < $ZSH_FSF_HIDDEN_FILE;
    echo \$depth > $ZSH_FSF_DEPH_FILE;
    depth_cmd=\"\";
    depth_prompt=\"0\";
    if [[ \"\$depth\" != \"0\" ]]; then
      depth_cmd=\" -d \$depth\";
      depth_prompt=\$depth;
    fi
    if [[ \"\$is_hidden\" == \"1\" ]]; then 
      echo \"reload($FZF_HIDDEN_ALT_C_COMMAND\$depth_cmd)+change-prompt(H\$depth_prompt> )\"
    else
      echo \"reload($FZF_NOHIDDEN_ALT_C_COMMAND\$depth_cmd)+change-prompt(\$depth_prompt> )\"
    fi"

export fzf_change_ctrl_t_depth="
    read is_hidden < $ZSH_FSF_HIDDEN_FILE;
    echo \$depth > $ZSH_FSF_DEPH_FILE;
    depth_cmd=\"\";
    depth_prompt=\"0\";
    if [[ \"\$depth\" != \"0\" ]]; then
      depth_cmd=\" -d \$depth\";
      depth_prompt=\$depth;
    fi
    if [[ \"\$is_hidden\" == \"1\" ]]; then 
      echo \"reload($FZF_HIDDEN_CTRL_T_COMMAND\$depth_cmd)+change-prompt(H\$depth_prompt> )\"
    else
      echo \"reload($FZF_NOHIDDEN_CTRL_T_COMMAND\$depth_cmd)+change-prompt(\$depth_prompt> )\"
    fi"

export FZF_CTRL_T_OPTS="$FZF_CTRL_T_OPTS
--bind 'start:transform:
    read is_hidden < $ZSH_FSF_HIDDEN_FILE; 
    read depth < $ZSH_FSF_DEPH_FILE;
    depth_cmd=\"\";
    depth_prompt=\"0\";
    if [[ \"\$depth\" != \"0\" ]]; then
      depth_cmd=\" -d \$depth\"
      depth_prompt=\$depth
    fi
    if [[ \"\$is_hidden\" == \"1\" ]]; then 
      echo \"reload($FZF_HIDDEN_CTRL_T_COMMAND\$depth_cmd)+change-prompt(H\$depth_prompt>)\"
    else
      echo \"reload($FZF_NOHIDDEN_CTRL_T_COMMAND\$depth_cmd)+change-prompt(\$depth_prompt>)\"
    fi'
--bind 'alt-0:transform: local depth=0; $fzf_change_ctrl_t_depth'
--bind 'alt-1:transform: local depth=1; $fzf_change_ctrl_t_depth'
--bind 'alt-2:transform: local depth=2; $fzf_change_ctrl_t_depth'
--bind 'alt-3:transform: local depth=3; $fzf_change_ctrl_t_depth'
--bind 'alt-4:transform: local depth=4; $fzf_change_ctrl_t_depth'
--bind 'alt-5:transform: local depth=5; $fzf_change_ctrl_t_depth'
--bind 'alt-6:transform: local depth=6; $fzf_change_ctrl_t_depth'
--bind 'alt-7:transform: local depth=7; $fzf_change_ctrl_t_depth'
--bind 'alt-8:transform: local depth=8; $fzf_change_ctrl_t_depth'
--bind 'alt-9:transform: local depth=9; $fzf_change_ctrl_t_depth'
--bind '?:toggle-preview'
--bind 'ctrl-j:preview-page-down'
--bind 'ctrl-k:preview-page-up'
--bind 'ctrl-a:toggle-all'
--bind 'ctrl-d:deselect'
--bind 'ctrl-s:select'
--bind 'alt-v:execute(nvim {+} >/dev/tty)'
--bind 'alt-c:execute(code {+})'
--bind 'ctrl-q:execute(qtcreator -client {+})'
--bind 'alt-bs:clear-query'
--bind 'ctrl-h:transform:
    read is_hidden < $ZSH_FSF_HIDDEN_FILE; 
    read depth < $ZSH_FSF_DEPH_FILE;
    depth_cmd=\"\";
    depth_prompt=\"0\";
    if [[ \"\$depth\" != \"0\" ]]; then
      depth_cmd=\" -d \$depth\";
      depth_prompt=\$depth;
    fi
    if [[ \"\$is_hidden\" == \"0\" ]]; then 
      echo 1 > $ZSH_FSF_HIDDEN_FILE; 
      echo \"reload($FZF_HIDDEN_CTRL_T_COMMAND\$depth_cmd)+change-prompt(H\$depth_prompt> )\"
    else
      echo 0 > $ZSH_FSF_HIDDEN_FILE; 
      echo \"reload($FZF_NOHIDDEN_CTRL_T_COMMAND\$depth_cmd)+change-prompt(\$depth_prompt> )\"
    fi'
--header '? - toggle preview. ctrl+j - preview pagedown. ctrl+k - preview pageup
alt+bs - clear
ctrl+a - (de)select all. ctrl+s - select. ctrl+d - deselect. 
alt+v - nvim. alt+c - vscode. ctrl+q - qtcreator. 
alt+n  - set depth
ctrl+h - toggle hiddens'
"

FZF_ALT_C_OPTS="$FZF_ALT_C_OPTS
--bind 'start:transform:
    read is_hidden < $ZSH_FSF_HIDDEN_FILE; 
    read depth < $ZSH_FSF_DEPH_FILE;
    depth_cmd=\"\";
    depth_prompt=\"0\";
    if [[ \"\$depth\" != \"0\" ]]; then
      depth_cmd=\" -d \$depth\"
      depth_prompt=\$depth
    fi
    if [[ \"\$is_hidden\" == \"1\" ]]; then 
      echo \"reload($FZF_HIDDEN_ALT_C_COMMAND\$depth_cmd)+change-prompt(H\$depth_prompt>)\"
    else
      echo \"reload($FZF_NOHIDDEN_ALT_C_COMMAND\$depth_cmd)+change-prompt(\$depth_prompt>)\"
    fi'
--bind 'alt-0:transform: local depth=0; $fzf_change_alt_c_depth'
--bind 'alt-1:transform: local depth=1; $fzf_change_alt_c_depth'
--bind 'alt-2:transform: local depth=2; $fzf_change_alt_c_depth'
--bind 'alt-3:transform: local depth=3; $fzf_change_alt_c_depth'
--bind 'alt-4:transform: local depth=4; $fzf_change_alt_c_depth'
--bind 'alt-5:transform: local depth=5; $fzf_change_alt_c_depth'
--bind 'alt-6:transform: local depth=6; $fzf_change_alt_c_depth'
--bind 'alt-7:transform: local depth=7; $fzf_change_alt_c_depth'
--bind 'alt-8:transform: local depth=8; $fzf_change_alt_c_depth'
--bind 'alt-9:transform: local depth=9; $fzf_change_alt_c_depth'
--bind '?:toggle-preview'
--bind 'ctrl-j:preview-page-down'
--bind 'ctrl-k:preview-page-up'
--bind 'alt-bs:clear-query'
--bind 'ctrl-h:transform:
    read is_hidden < $ZSH_FSF_HIDDEN_FILE; 
    read depth < $ZSH_FSF_DEPH_FILE;
    depth_cmd=\"\";
    depth_prompt=\"0\";
    if [[ \"\$depth\" != \"0\" ]]; then
      depth_cmd=\" -d \$depth\";
      depth_prompt=\$depth;
    fi
    if [[ \"\$is_hidden\" == \"0\" ]]; then 
      echo 1 > $ZSH_FSF_HIDDEN_FILE; 
      echo \"reload($FZF_HIDDEN_ALT_C_COMMAND\$depth_cmd)+change-prompt(H\$depth_prompt> )\"
    else
      echo 0 > $ZSH_FSF_HIDDEN_FILE; 
      echo \"reload($FZF_NOHIDDEN_ALT_C_COMMAND\$depth_cmd)+change-prompt(\$depth_prompt> )\"
    fi'
--header '? - toggle preview. ctrl+j - preview pagedown. ctrl+k - preview pageup
alt+bs - clear
alt+n  - set depth
ctrl+h - toggle hiddens'
"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
