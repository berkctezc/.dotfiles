# exports
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='micro'
export NODE_REPL_MODE='sloppy';
export ZSH="$HOME/.dotfiles/.oh-my-zsh"
export MANPATH="/usr/local/man:$MANPATH"
export PATH="$PATH:/$HOME/.dotnet/tools"
export PATH="$PATH:/$HOME/.local/bin"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$(brew --prefix python)/libexec/bin"
export HF_HOME="$HOME/llm/oobabooga/text-generation-webui/models"
export TERM="xterm-256color"
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

set -gx PATH $PATH $HOME/.cache/lm-studio/bin

# utils
alias sudo 'sudo '
alias week 'date +%V'
alias tks 'tmux kill-server'
alias lscount 'ls -1 | wc -l'
alias cleandotnet 'find . -iname "bin" -o -iname "obj" | xargs rm -rf'
alias dotnethardrebuild='dotnet clean;find . -iname "bin" -o -iname "obj" | xargs rm -rf;dotnet restore;dotnet build'
alias nugetpurge='rm -rf ~/.nuget/packages/'
alias i 'brew install;'

# network
alias myip 'dig +short myip.opendns.com @resolver1.opendns.com'
alias localip 'ipconfig getifaddr en0'
alias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive "ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# maintanance
alias macupdate 'sudo softwareupdate -i -a'
alias update 'brew update; brew upgrade --formula; brew upgrade --greedy'
alias gemupdate 'sudo gem update --system; sudo gem update;'
alias flush "dscacheutil -flushcache && killall -HUP mDNSResponder"
alias cleanup "brew cleanup --prune=all;rm -rf ~/.cache/*;brew autoremove;rm -rf ~/Library/Caches/* ~/Library/Logs/* 2>/dev/null ~/Library/Containers/com.apple.mail/Data/Library/Mail\ Downloads/*;sudo gem cleanup"
alias reload "exec $SHELL -l"
alias maintain "update && cleanup && flush && reload;"
alias ubuntumaintain "sudo apt update -y && sudo apt upgrade -y &&  sudo apt full-upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && update && cleanup"
alias backup_brew "cd ~ && ./scripts/brew_list.sh"

# navigation
alias ..  "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

# os specific adjustments
if test (uname -s) = "Darwin"
  alias copy pbcopy # copy to clipboard
  # (╯°□°)╯︵ ┻━┻
  alias browser 'open /Applications/Zen.app'
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

else
  alias copy 'xclip -sel clip'
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

if status is-interactive
  atuin init fish --disable-up-arrow | source
	if set -q TMUX
        fastfetch;
    else
        tmux new;
	end
end