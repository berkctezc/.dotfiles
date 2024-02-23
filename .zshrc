# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='nano'

# Set name of the theme to load --- if set to "random" ...
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=random
ZSH_THEME_RANDOM_CANDIDATES=(  )

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

if [ "$(arch)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

if [ "$TMUX" = "" ]; then tmux -u; fi

fish