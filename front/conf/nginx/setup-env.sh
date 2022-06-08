#!/usr/bin/env sh

export BACK_URL

envsubst </env.js.tpl >/var/www/dist/app/env.js