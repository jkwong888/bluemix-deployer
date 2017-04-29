#!/bin/bash

source /bx_login.sh 
# initialize docker using container registry secret
bx cs init

exec "$@"
