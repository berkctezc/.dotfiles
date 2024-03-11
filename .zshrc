#exports
export ZSH="$HOME/.oh-my-zsh"
export LANG="en_US.UTF-8"
export MANPATH="/usr/local/man:$MANPATH"
export ARCHFLAGS="-arch x86_64"
export LC_ALL="en_US.UTF-8"
export EDITOR='micro'
export NODE_REPL_MODE='sloppy';

# Set name of the theme to load --- if set to "random" ...
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME_RANDOM_CANDIDATES=(  )
plugins=(git)

source $ZSH/oh-my-zsh.sh

if [ "$(arch)" = "arm64" ]; then ; eval "$(/opt/homebrew/bin/brew shellenv)"
else; eval "$(/usr/local/bin/brew shellenv)";fi

 [ -d /home/linuxbrew/.linuxbrew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

#if [ "$TMUX" = "" ]; then tmux -u; fi
