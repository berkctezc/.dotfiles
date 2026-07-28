##############
# zsh + omz #
#############
export ZSH="$HOME/.oh-my-zsh";

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
	git branch brew
	kubectl kubectx
	docker docker-compose
	mongocli postgres redis-cli
	# text editor thingies
	textmate vscode
	# zsh thingies
	zsh-interactive-cd zsh-navigation-tools themes
	web-search  zsh-autosuggestions
	you-should-use zsh-history-substring-search
	# os and system thingies
	archlinux debian systemd
	macos iterm2 brew
	battery web-search
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
alias lscount='ls -1 | wc -l'

# dotnet
alias cleandotnet='find . -iname "bin" -o -iname "obj" | xargs rm -rf'
alias dotnethardrebuild='dotnet clean;find . -iname "bin" -o -iname "obj" | xargs rm -rf;dotnet restore;dotnet build'
alias nugetpurge='rm -rf ~/.nuget/packages'

# network
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="if ip addr show en0 >/dev/null 2>&1; then ip addr show en0 | grep 'inet ' | awk '{print \$2}' | cut -d/ -f1; else hostname -I | awk '{print \$1}'; fi"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# maintenance
alias reload="exec $SHELL -l"
alias archmaintain="sudo pacman -Syu --noconfirm; sudo pacman -Sc --noconfirm"
alias backup_brew="cd ~ && ./scripts/brew_list.sh"

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# os gnostic
if [ "$(uname -s)" = "Darwin" ]; then
  alias copy='pbcopy'
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
else
  alias copy='xclip -sel clip'
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [[ $- == *i* ]]; then
  atuin init zsh --disable-up-arrow > /dev/null
  if [[ -n "$TMUX" ]]; then
    fastfetch;
  else
  	tmux new;
  fi
fi