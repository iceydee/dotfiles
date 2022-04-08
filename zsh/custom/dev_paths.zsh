DEV_PATH=~/src

dev() { cd $DEV_PATH/$1; }
dgo() { cd $DEV_PATH/GO_Dev/$1; }

autoload -U compinit compdef
compinit

_dev() { _files -W $DEV_PATH -/; }
_dgo() { _files -W $DEV_PATH/GO_Dev -/; }
compdef _dev dev
compdef _dgo dgo


gprune() {
  LOCAL=$(mktemp)
  REMOTE=$(mktemp)
  git branch | sed 's|* |  |' | sort > "${LOCAL}"
  git branch -r | sed 's|origin/||' | sort > "${REMOTE}"
  comm -23 "${LOCAL}" "${REMOTE}" | aws '{print $1}' | xargs git branch -D
  rm -f "${LOCAL}"
  rm -f "${REMOTE}"
}


