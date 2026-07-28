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

fish_config theme choose "mono-smoke"

# utils
alias sudo 'sudo '
alias week 'date +%V'
alias tks 'tmux kill-server'
alias lscount 'ls -1 | wc -l'
alias backup_brew "cd ~ && ./scripts/brew_list.sh"

# dotnet
alias cleandotnet 'find . -iname "bin" -o -iname "obj" | xargs rm -rf'
alias dotnethardrebuild 'dotnet clean;find . -iname "bin" -o -iname "obj" | xargs rm -rf;dotnet restore;dotnet build'
alias nugetpurge 'rm -rf ~/.nuget/packages/'

# network
alias myip 'dig +short myip.opendns.com @resolver1.opendns.com'
alias localip "ifconfig en0 2>/dev/null | grep 'inet ' | awk '{print \$2}' || hostname -I | awk '{print \$1}'"
alias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive "ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# maintenance
alias macupdate 'sudo softwareupdate -i -a'
alias brewupdate 'brew update;brew upgrade --greedy -y'
alias cleanup "brew cleanup --prune=all;brew autoremove;rm -rf ~/.cache/* ~/Library/Caches/* 2>/dev/null;sudo gem cleanup;brew doctor"
alias macmaintain "macupdate;brewupdate;cleanup"
alias flushdns "dscacheutil -flushcache && killall -HUP mDNSResponder"
alias reload "exec $SHELL -l"
alias archmaintain "sudo pacman -Syu --noconfirm && sudo pacman -Scc --noconfirm"

# navigation
alias ..  "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

# os gnostic
# (╯°□°)╯︵ ┻━┻
if test (uname -s) = "Darwin"
  alias copy pbcopy
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
else #linux
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