#!/bin/bash
set -x

echo "Command: $0 $@"

source /scripts/bx_login.sh

service_type=$1
service_plan=$2
service_name=$3 # optional if a service already exists

/scripts/create_service.sh ${service_type} ${service_plan} ${service_name}

bx cs init

# bind service to cluster
echo "Binding ${service_name} to ${KUBE_CLUSTER_NAME} ..."
bx cs cluster-service-bind ${KUBE_CLUSTER_NAME} default ${service_name}

