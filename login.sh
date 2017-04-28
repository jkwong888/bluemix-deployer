#!/bin/bash

export BLUEMIX_API_KEY=`cat /var/run/secrets/bluemix-api-key/api-key`

bx login -c ${BX_ORG} -s ${BX_SPACE}

exec "$@"
