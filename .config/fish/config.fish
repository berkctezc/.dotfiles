#if status is-interactive
    # Commands to run in interactive sessions can go here
#end
if test (uname -s) = "Darwin"
  # (╯°□°)╯︵ ┻━┻
  alias apt="brew"
  alias yum="brew"
  alias dnf="brew"
  alias pkg="brew"
  alias i="brew install"
  set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
  set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
end

if [ -n $SSH_CONNECTION ]
   export EDITOR='nano'
else
   export EDITOR='nano'
end

neofetch

zoxide init fish | source