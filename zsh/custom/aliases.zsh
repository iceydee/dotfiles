alias l='ls -alFh'
alias c='clear'
alias pico='pico -w'
alias gpat='git push --all && git push --tags'
alias gs='git status'
alias g-='git pull --rebase'
alias g+='git push'
alias gg='g- && g+'
alias rogo='git log --oneline --author=mio --after=`date +%Y-%m-%d`" 00:00" | cut -d" " -f2- | pbcopy'
alias rbp='rails_best_practices -f html --with-textmate . ; open rails_best_practices_output.html'
alias web='python -m SimpleHTTPServer'

alias gf='git flow'
alias gff='gf feature'
alias gfc='gff checkout'
alias gfr='gf release'

alias yb='rake yolo:release:ipa'

function gitstats {
  # Arg1 = from
  # Arg2 = to

  local TO=${2}
  if [ -z "${2}" ]; then
    TO="HEAD"
  fi

  echo `git diff --stat ${1}..${TO} | tail -n1`
  echo -n "Merges: "
  echo `git log --oneline --merges ${1}..${TO} | wc -l`
}

function vt {
  PREVIOUS_TAG=`git describe | cut -d'-' -f1`

  echo
  echo "Showing commits from ${PREVIOUS_TAG} to HEAD"
  echo

  git log --oneline ${PREVIOUS_TAG}..HEAD
  git log --oneline ${PREVIOUS_TAG}..HEAD | cut -d" " -f2- | pbcopy
}
