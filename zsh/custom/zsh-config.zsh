RPROMPT="\$(~/.rvm/bin/rvm-prompt s i v g)%{$fg[yellow]%}[%*]"

DEFAULT_USER="mio"

if whence dircolors >/dev/null; then
  eval `dircolors ~/.solarized/dircolors.ansi-dark`
else
  export CLICOLOR=1
  export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
fi
