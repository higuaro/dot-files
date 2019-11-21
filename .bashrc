# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

#-----------------
# BASH global conf
#-----------------
shopt -s cdspell

# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#--------
# ALIASes
#--------
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    # DIR_COLORS_FILE=~/.dircolors
    DIR_COLORS_FILE=~/.dir_colors
    test -r "${DIR_COLORS_FILE}" && eval "$(dircolors -b "${DIR_COLORS_FILE}")" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias terminal="urxvt -fn 'xft:Terminus (TTF):pixelsize=14:minspace=false, xft:DejaVu Sans:pixelsize=16'"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color'
alias bc='bc -l ~/.bcrc'
alias pbcopy='xclip -selection c'
alias fix-display-l='xrandr --output HDMI1 --off &&  xrandr --output HDMI1 --auto --left-of eDP1'
alias fix-display-r='xrandr --output HDMI1 --off &&  xrandr --output HDMI1 --auto --right-of eDP1'
alias fix-gaming-mouse='xinput --set-prop "pointer:USB Gaming Mouse" "libinput Accel Speed" -0.9 2>/dev/null'

# Disable touchpad middle click
alias mc-off='xmodmap -e "pointer = 1 25 3 4 5 6 7 8 9"'
alias mc-on='xmodmap -e "pointer = 1 2 3 4 5 6 7 8 9"'

alias mem-usage="ps aux  | awk '{print \$6/1024 \" MB\t\t\" \$11}' | sort -n"
alias error-report='sudo journalctl -p 3 -xb'
alias who-failed='sudo systemctl --failed'

#----------
# FUNCTIONS
#----------
title() { printf "\e]2;$*\a"; }

function up() {
  local steps=0;
  re='^[0-9]+$';
  if [ $# -ne 0 ]; then
    if [[ $1 =~ $re ]]; then
        steps=$(( $1 - 1 )); 
    fi;
  fi; 
  local path="..";
  while [ $steps -gt 0 ]; do
    path="${path}/..";
    let steps--;
  done;
  cd "$path"
}

function hex() {
  bc <<<"obase=16;$1"
}

#------
# FIXES
#------
# Keyboard rate (Manjaro+i3 doesn't persist this setting through the UI)
xset r rate 170 30

# In case we have the mouse pluged in
fix-gaming-mouse

#----------------
# POWER LINE conf
#----------------
function _update_ps1() {
  PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

#-------------------
# Local custom stuff
#-------------------
if [ -f ~/.bashrc-local ]; then
  source ~/.bashrc-local
fi

#-----------------
# PATH enhancement
#-----------------
export PATH="${PATH}:~/bin/:~/.local/bin:/opt/nbfc"

#--------------------------
# VARIABLES, custom EXPORTS
#--------------------------
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/${USER}/.sdkman"
[[ -s "/home/${USER}/.sdkman/bin/sdkman-init.sh" ]] && source "/home/${USER}/.sdkman/bin/sdkman-init.sh"

