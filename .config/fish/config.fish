set -gx PATH $HOME/.local/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH $HOME/.dotnet/tools $PATH

# Exports
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='micro'
export NODE_REPL_MODE='sloppy';
export ZSH="$HOME/.oh-my-zsh"
export MANPATH="/usr/local/man:$MANPATH"

# Utils
alias sudo 'sudo '
alias week 'date +%V'
alias tks 'tmux kill-server'
# Network
alias myip "dig +short myip.opendns.com @resolver1.opendns.com"
alias localip "ipconfig getifaddr en0"
alias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive "ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
# Maintanance
alias macupdate 'sudo softwareupdate -i -a'
alias update 'brew update && brew upgrade; npm install npm -g && npm update -g ; sudo gem update --system; sudo gem update'
alias flush "dscacheutil -flushcache && killall -HUP mDNSResponder"
alias cleanup "brew cleanup && sudo gem cleanup && echo 'started .DS_Store cleanup' && find . -name ".DS_Store" -type f -delete && echo 'finished .DS_Store cleanup'"
alias reload "exec $SHELL -l"
alias maintain "update && cleanup && flush && reload;"
alias backup_brew "cd ~ && ./scripts/brew_list.sh"
# Navigation
alias ..  "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

# copy to clipboard
if test (uname -s) = "Darwin"
  alias copy pbcopy
    # (╯°□°)╯︵ ┻━┻
  alias apt brew
  alias yum brew
  alias dnf brew
  alias pkg brew
  alias i "brew install"
	alias chrome '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
  set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
  set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
else
  alias copy 'xclip -sel clip'
end

if status is-interactive
  atuin init fish --disable-up-arrow | source
	if set -q TMUX
    neofetch
	end
	# tmux new
end
