function ensureSignIn {
  op user get mio@plingot.com > /dev/null 2>&1
  if [ "$?" -ne 0 ]; then
    eval $(op signin)
  fi
}

function opf {
  local QUERY
  local TAGS
  local VAULT

  if [ -z "${1}" ]; then
    echo "usage: ${0} [query] (tags) (vault)"
    return -1
  fi

  ensureSignIn

  QUERY="${1}"
  TAGS="${2}"
  VAULT="${3:-Personal}"

  op item list --vault "${VAULT}" --tags "${TAGS}" --format=json | jq -r ".[] | select(.title | ascii_downcase | contains(\"${QUERY}\"))"
}

function ops {
  ensureSignIn
  opf $@ | jq -r '.id'
}

function opc {
  ensureSignIn
  local ID=$(ops $@)
  op item get "${ID}" --fields password | jq -r | pbcopy
}
