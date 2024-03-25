#exports
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='micro'
export NODE_REPL_MODE='sloppy';
export ZSH="$HOME/.oh-my-zsh"
export MANPATH="/usr/local/man:$MANPATH"
export PATH="$PATH:/$HOME/.dotnet/tools"

# options
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

source $ZSH/oh-my-zsh.sh


neofetch
