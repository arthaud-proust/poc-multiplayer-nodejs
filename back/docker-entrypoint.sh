#!/bin/bash

# remove node user
userdel node
# create user for app
useradd app --shell /bin/bash --home /home/app --uid="$APP_UID"
mkdir -p /home/app && chown app:app /home/app

chmod 777 /var/www

if [[ "$ENV_MODE" != "production" ]]
then
    su -c "npm install" app
    su -c "npm run start" app
fi
