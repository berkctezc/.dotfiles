[ -d /home/linuxbrew/.linuxbrew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

set -gx PATH $HOME/.local/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH

#exports
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='micro'
export NODE_REPL_MODE='sloppy';
export ZSH="$HOME/.oh-my-zsh"
export MANPATH="/usr/local/man:$MANPATH"
export ARCHFLAGS="-arch x86_64"

# Utils
alias sudo 'sudo '
alias week 'date +%V'
alias chrome '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
# Network
alias myip "dig +short myip.opendns.com @resolver1.opendns.com"
alias localip "ipconfig getifaddr en0"
alias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias scanlocal "arp -a"
alias ifactive "ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Maintanance
alias update 'sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'
alias lscleanup "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
alias flush "dscacheutil -flushcache ; killall -HUP mDNSResponder"
alias cleanup "lscleanup ; echo 'started .DS_Store cleanup' && find . -type f -name '*.DS_Store' -delete 2>/dev/null"
alias reload "exec $SHELL -l"
alias maintain "update;cleanup;flush;reload;"
alias backup_brew "cd ~ && ./scripts/brew_list.sh"

# Fun
alias stfu "osascript -e 'set volume output muted true'"
alias pumpitup "osascript -e 'set volume output volume 100'"

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
  set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
  set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
else
  alias copy 'xclip -sel clip'5
end

if status is-interactive
  atuin init fish --disable-up-arrow | source
end

neofetch
