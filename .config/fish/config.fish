if status is-interactive
  atuin init fish --disable-up-arrow | source
end

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

export EDITOR='nano'

neofetch

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/berkcantezcaner/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
