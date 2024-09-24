##############
# zsh + omz #
#############
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.dotfiles/.oh-my-zsh";

setopt NO_HUP
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD

ZSH_THEME="agnoster" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

plugins=(
	# dev thingies
	dotnet node npm pip python
	git branch
	kubectl kubectx
	docker docker-compose
	mongocli postgres redis-cli
	# text editor thingies
	textmate vscode
	# zsh thingies
	zsh-interactive-cd zsh-navigation-tools themes
	web-search
	# os and system thingies
	archlinux debian systemd
	macos iterm2 brew
	battery
	# terminal utility thingies
	fzf gnu-utils ssh sudo
	tmux screen
)

source $ZSH/oh-my-zsh.sh

##############
# zsh + omz #
#############

############################################################

# exports
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";
export EDITOR='micro';
export NODE_REPL_MODE='sloppy';
export MANPATH="/usr/local/man:$MANPATH";
export PATH="$PATH:/$HOME/.dotnet/tools";
export PATH="$PATH:$HOME/.local/bin";
export PATH="$PATH:/opt/homebrew/bin";

# utils
alias sudo='sudo '
alias week='date +%V'
alias tks='tmux kill-server'
alias lse='eza --icons'
alias lscount='ls -1 | wc -l'
alias cleandotnet='find . -iname "bin" -o -iname "obj" | xargs rm -rf'
alias dotnethardrebuild='dotnet clean;find . -iname "bin" -o -iname "obj" | xargs rm -rf;dotnet restore;dotnet build'
alias nugetpurge='rm -rf ~/.nuget/packages'
alias i="brew install;"

# network
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# maintanance
alias update='brew update ; brew upgrade; sudo gem update --system; sudo gem update'
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias cleanup="brew cleanup ; sudo gem cleanup ; echo 'started .DS_Store cleanup' && sudo find . -name ".DS_Store" -type f -delete && echo 'finished .DS_Store cleanup'"
alias reload="exec $SHELL -l"
alias maintain="update && cleanup && flush && reload;"
alias ubuntumaintain="sudo apt update -y && sudo apt upgrade -y &&  sudo apt full-upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y"
alias backup_brew="cd ~ && ./scripts/brew_list.sh"

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
  atuin init zsh --disable-up-arrow > /dev/null;
  if [[ -n "$TMUX" ]]; then
    fastfetch;
  else
	tmux
  fi
fi
