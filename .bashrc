if [[ $(uname) != "Darwin" ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

case $- in
  *i*) ;;
    *) return;;
esac

# osh configuration
export OSH='/Users/berkcantezcaner/.oh-my-bash'
OSH_THEME="agnoster"
# OMB_THEME_RANDOM_IGNORED=()
# OMB_CASE_SENSITIVE="true"
# OMB_HYPHEN_SENSITIVE="false"
DISABLE_AUTO_UPDATE="false"
export UPDATE_OSH_DAYS=5
DISABLE_LS_COLORS="false"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# SCM_GIT_DISABLE_UNTRACKED_DIRTY="true"
# SCM_GIT_IGNORE_UNTRACKED="true"
# OMB_DEFAULT_ALIASES="check"
OMB_USE_SUDO=true
OMB_PROMPT_SHOW_PYTHON_VENV=true

# ~/.oh-my-bash/completions/*
completions=(
  git
  composer
  ssh
  awscli
  brew
  defaults
  docker-compose
  docker-machine
  docker
  gh
  git_flow
  kubectl
  makefile
  minikube
  npm
  pip
  ssh
  system
  terraform
  tmux
)

# ~/.oh-my-bash/aliases/*
aliases=(
  general
  chmod
  debian
  docker
  ls
  misc
  package-manager
  terraform
)

# ~/.oh-my-bash/plugins/*
plugins=(
  git
  bashmarks
  zoxide
  xterm
  tmux-autoattach
  sudo
  pyenv
  progress
  npm
  kubectl
  brew
  battery

)

source "$OSH"/oh-my-bash.sh

export MANPATH="/usr/local/man:$MANPATH"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='micro'
export NODE_REPL_MODE='sloppy';
export ZSH="$HOME/.oh-my-zsh"
export MANPATH="/usr/local/man:$MANPATH"

# Utils
alias sudo='sudo '
alias week='date +%V'
alias tks='tmux kill-server'
alias neofetch='fastfetch'

# Network
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Maintanance
alias macupdate='sudo softwareupdate -i -a'
alias update='brew update && brew upgrade; sudo gem update --system; sudo gem update'
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias cleanup="brew cleanup && sudo gem cleanup && echo 'started .DS_Store cleanup' && sudo find . -name ".DS_Store" -type f -delete && echo 'finished .DS_Store cleanup'"
alias reload="exec $SHELL -l"
alias maintain="update && cleanup && flush && reload;"
alias backup_brew="cd ~ && ./scripts/brew_list.sh"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
