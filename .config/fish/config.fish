if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test (uname -s) = "Darwin"
  set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
  set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
end

zoxide init fish | source