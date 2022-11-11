set -o vi
export EDITOR=vim
export BASH_SILENCE_DEPRECATION_WARNING=1

################################################################################
### Aliase
################################################################################

alias es='exa -G --icons'
alias cat='bat'
# alias ll='exa -laG --icons'
alias ll='exa -alm --no-user --no-permissions --bytes --git --time-style long-iso --group-directories-first --icons'
alias etree='ll --tree --level=2'
alias lt='exa -laGT --icons'
alias cal='gcal --starting-day=1'
alias oc9l='oc login https://eu-muc-9.openshift.ops.cc.bmwgroup.net:8443 -u qxz2bl7 -p $(base64 -d $HOME/.pass) -n default'
alias oc10l='oc login https://eu-muc-10.openshift.ops.cc.bmwgroup.net:8443 -u qxz2bl7 -p $(base64 -d $HOME/.pass) -n default'
alias oc12l='oc login https://eu-muc-12.openshift.ops.cc.bmwgroup.net:8443 -u qxz2bl7 -p $(base64 -d $HOME/.pass) -n default'
alias gitdot='git --git-dir=$HOME/dotfiles --work-tree=$HOME'

alias gc='git c'
alias gca='git ca'
alias gcb='git cb'
alias gcm='git cm'
alias gm='git m'
alias gl='git l'
alias gll='git ll'
alias gst='git st'
alias gsl='git sl'
alias gsln='git sln'
alias gpsup='git psup'

eval "$(starship init bash)"
eval "$(direnv hook bash)"
# eval "$(jenv init -)"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
eval "$(register-python-argcomplete pipx)"
kubectl config unset current-context > /dev/null

################################################################################
### Tools
################################################################################

export PATH="/usr/local/opt/node@16/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export GREP_OPTIONS=' --color=auto'

# HSTR configuration
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)

# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export HISTTIMEFORMAT='[%d-%m-%y %H:%M] '
export XDG_CONFIG_HOME="$HOME"

# Krew Plugin Manager
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin:$PATH"

# BAT

export BAT_THEME="gruvbox-dark"

# import my own functions
for file in "$HOME"/functions/*; do
  source "$file"
done

################################################################################
### Completions
################################################################################

for file in "$HOME"/.config/completion/*; do
  source "$file"
done
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

################################################################################
## BMW specific stuff
################################################################################

# ARTIFACTORY helper scripts
export PATH="$HOME/workspace/doc-internal/operator/services/artifactory/docs-on-call/scripts/:$PATH"
source "$HOME"/workspace/wmb/doc-internal/operator/services/artifactory/docs-on-call/scripts/completions_af-arbitrary-command.sh
source "$HOME"/workspace/wmb/doc-internal/operator/services/artifactory/docs-on-call/scripts/completions_restart-af-services.sh


export GH_HOST=cc-github.bmwgroup.net
alias ghlogin='gh auth login --hostname ${GH_HOST}'
# source /Users/michael.klammer/.bash_completions/doit.sh

################################################################################
### Private
################################################################################

export PLAYDATE_SDK_PATH=~/Developer/PlaydateSDK/

# Created by `pipx` on 2022-10-23 16:18:43
export PATH="$PATH:/Users/michael.klammer/.local/bin"
