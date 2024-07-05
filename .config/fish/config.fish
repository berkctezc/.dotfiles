# exports
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='micro'
export NODE_REPL_MODE='sloppy';
export ZSH="$HOME/.dotfiles/.oh-my-zsh"
export MANPATH="/usr/local/man:$MANPATH"
export PATH="$PATH:/$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/homebrew/bin"

# utils
alias sudo 'sudo '
alias week 'date +%V'
alias tks 'tmux kill-server'
alias neofetch 'fastfetch'
alias lscount 'ls -1 | wc -l'
alias cleandotnet 'find . -iname "bin" -o -iname "obj" | xargs rm -rf'
alias i "brew install"

# network
alias myip "dig +short myip.opendns.com @resolver1.opendns.com"
alias localip "ipconfig getifaddr en0"
alias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive "ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# maintanance
alias macupdate 'sudo softwareupdate -i -a'
alias update 'brew update && brew upgrade; sudo gem update --system; sudo gem update'
alias flush "dscacheutil -flushcache && killall -HUP mDNSResponder"
alias cleanup "brew cleanup && sudo gem cleanup && echo 'started .DS_Store cleanup' && sudo find . -name ".DS_Store" -type f -delete && echo 'finished .DS_Store cleanup'"
alias reload "exec $SHELL -l"
alias maintain "update && cleanup && flush && reload;"
alias backup_brew "cd ~ && ./scripts/brew_list.sh"

# navigation
alias ..  "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

# non os agnostic
if test (uname -s) = "Darwin"
  alias copy pbcopy # copy to clipboard
    # (╯°□°)╯︵ ┻━┻
  alias apt brew
  alias yum brew
  alias dnf brew
  alias pkg brew
	alias chrome '/Applications/Thorium.app/Contents/MacOS/Thorium'
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
	end
end
