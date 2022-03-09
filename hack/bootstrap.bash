#! /bin/bash

export KUBECONFIG=$HOME/.kube/config
cp $KUBECONFIG apps/cerberus/base/kubeconfig

wait_for_cerberus() {
    cerberus_route=$(oc get route -n cerberus cerberus -o template='{{.spec.host}}')
    until [[ $(curl -s ${cerberus_route}) = "True" ]]; do
        echo -ne "."; sleep 2s;
    done
}

kustomize build clusters/cluster-validation | oc apply -f - && \
wait_for_cerberus
