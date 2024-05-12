# Exports
	export LANG="en_US.UTF-8"
	export LC_ALL="en_US.UTF-8"
	export EDITOR='micro'
	export NODE_REPL_MODE='sloppy';
	export ZSH="$HOME/.oh-my-zsh"
	export MANPATH="/usr/local/man:$MANPATH"
	export PATH="$PATH:/$HOME/.dotnet/tools"
	export PATH="$PATH:$HOME/.local/bin"
	export PATH="$PATH:/opt/homebrew/bin"

# Zsh Options
	setopt NO_HUP
	setopt HIST_VERIFY
	setopt SHARE_HISTORY
	setopt EXTENDED_HISTORY
	setopt PROMPT_SUBST
	setopt CORRECT
	setopt COMPLETE_IN_WORD

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster" # ZSH_THEME_RANDOM_CANDIDATES=(  )

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

# Utils
alias sudo='sudo '
alias week='date +%V'
alias tks='tmux kill-server'
# Network
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
# Maintanance
alias update='sudo softwareupdate -i -a ; brew update && brew upgrade ; sudo gem update --system; sudo gem update'
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias cleanup="brew cleanup && sudo gem cleanup && echo 'started .DS_Store cleanup' && find . -type f -name '*.DS_Store' -delete 2>/dev/null"
alias reload="exec $SHELL -l"
alias maintain="update && cleanup && flush && reload;"
alias backup_brew="cd ~ && ./scripts/brew_list.sh"
# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

source $ZSH/oh-my-zsh.sh

fastfetch
