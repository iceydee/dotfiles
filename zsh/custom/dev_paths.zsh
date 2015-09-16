DEV_PATH=~/src

dev() { cd $DEV_PATH/$1; }
dgo() { cd $DEV_PATH/GO_Dev/$1; }

autoload -U compinit compdef
compinit

_dev() { _files -W $DEV_PATH -/; }
_dgo() { _files -W $DEV_PATH/GO_Dev -/; }
compdef _dev dev
compdef _dgo dgo
