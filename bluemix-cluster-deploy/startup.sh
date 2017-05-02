#!/bin/bash

source /scripts/bx_login.sh 

# initialize docker using container registry secret
bx cs init

exec "$@"
