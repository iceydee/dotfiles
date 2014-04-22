call pathogen#infect()

syntax enable

set backspace=indent,eol,start

:if $VIM_CRONTAB == "true"
:set nobackup
:set nowritebackup
:endif
