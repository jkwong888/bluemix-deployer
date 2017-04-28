#!/bin/bash

if [ -f "/var/run/secrets/bluemix-api-key/api-key" ]; then
    BLUEMIX_API_KEY=`cat /var/run/secrets/bluemix-api-key/api-key`
fi

bx login -a ${BX_API_ENDPOINT} -s ${BX_SPACE}

# initialize docker using container registry secret
bx cr login

exec "$@"
