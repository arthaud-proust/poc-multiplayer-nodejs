#!/usr/bin/env sh

getenv() {
  if [[ -z "$1" ]]
  then
    echo "$2"
  else
    echo "$1"
  fi
}

# export API_URL=$(getenv "${API_URL}" "https://validation.api.locadeo.tv")

envsubst </env.js.tpl >/var/www/dist/app/env.js