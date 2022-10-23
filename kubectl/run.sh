#!/bin/bash 

namespace=$1
app=$2
container=$3
cmd=$4

pod=$(kubectl get pods -n $namespace -l app=$app --field-selector status.phase=Running | cut -f1 -d ' ' | tail -n 1 )

echo "Using pod $pod"
echo "CMD : $cmd"
kubectl exec $pod -n $namespace -c $container -- /bin/bash -c "$cmd"