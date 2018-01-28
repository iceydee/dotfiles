alias l='ls -alFh'
alias c='clear'
alias gpat='git push --all && git push --tags'
alias gs='git status'
alias g-='git pull --rebase'
alias g+='git push'
alias gu='g- && g+'
alias t='task add project:scratch'

alias crontab="VIM_CRONTAB=true crontab"

alias gf='git flow'
alias gff='gf feature'
alias gfc='gff checkout'
alias gfr='gf release'

alias vp='vagrant provision'
alias vu='vagrant up'

alias gi='ghi open --claim -M'
alias git='hub'

alias v='vagrant'
alias vp='vagrant provision'
alias vu='vagrant up'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

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
