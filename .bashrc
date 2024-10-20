##############
# bash + osh #
##############

case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH="$HOME/.oh-my-bash"
. "$HOME/.cargo/env"

# osh configuration
OSH_THEME="agnoster"
OMB_THEME_RANDOM_IGNORED=()
OMB_CASE_SENSITIVE="true"
OMB_HYPHEN_SENSITIVE="false"
DISABLE_AUTO_UPDATE="false"
export UPDATE_OSH_DAYS=5
DISABLE_LS_COLORS="false"
COMPLETION_WAITING_DOTS="true"
OMB_USE_SUDO=true
OMB_PROMPT_SHOW_PYTHON_VENV=true

completions=( # ~/.oh-my-bash/completions/*
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

aliases=( # ~/.oh-my-bash/aliases/*
  general
  chmod
  debian
  docker
  ls
  misc
  package-manager
  terraform
)

plugins=( # ~/.oh-my-bash/plugins/*
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

##############
# bash + osh #
##############

[ -n "$PS1" ] && source ~/.bash_profile;

############################################################

# exports
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";
export EDITOR='micro';
export NODE_REPL_MODE='sloppy';
export ZSH="$HOME/.dotfiles/.oh-my-zsh";
export MANPATH="/usr/local/man:$MANPATH";
export PATH="$PATH:/$HOME/.dotnet/tools";
export PATH="$PATH:$HOME/.local/bin";
export PATH="$PATH:/opt/homebrew/bin";

# utils
alias sudo='sudo '
alias week='date +%V'
alias tks='tmux kill-server'
alias neofetch='fastfetch'
alias lscount='ls -1 | wc -l'
alias cleandotnet='find . -iname "bin" -o -iname "obj" | xargs rm -rf'
alias dotnethardrebuild='dotnet clean;find . -iname "bin" -o -iname "obj" | xargs rm -rf;dotnet restore ;dotnet build'
alias nugetpurge='rm -rf ~/.nuget/packages/'
alias i='brew install;'

# network
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'
alias ips='ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }''
alias ifactive='ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active''

# maintanance
alias update='brew update ; brew upgrade; sudo gem update --system; sudo gem update'
alias flush='dscacheutil -flushcache && killall -HUP mDNSResponder'
alias cleanup='brew cleanup ; sudo gem cleanup ; echo 'started .DS_Store cleanup' && sudo find . -name ".DS_Store" -type f -delete && echo 'finished .DS_Store cleanup''
alias reload='exec $SHELL -l'
alias maintain='update && cleanup && flush && reload;'
alias ubuntumaintain="sudo apt update -y && sudo apt upgrade -y &&  sudo apt full-upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y"
alias backup_brew= 'cd ~ && ./scripts/brew_list.sh'

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# non os agnostic
if [ "$(uname -s)" = "Darwin" ]; then
  alias macupdate='sudo softwareupdate -i -a'
  alias copy='pbcopy' # copy to clipboard
  # (╯°□°)╯︵ ┻━┻
  alias apt='brew'
  alias yum='brew'
  alias dnf='brew'
  alias pkg='brew'
  alias chrome='/Applications/Thorium.app/Contents/MacOS/Thorium'
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
else
  alias copy='xclip -sel clip'
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [[ $- == *i* ]]; then
  atuin init bash --disable-up-arrow > /dev/null;
  if [[ -n "$TMUX" ]]; then
    fastfetch;
  fi
fi
