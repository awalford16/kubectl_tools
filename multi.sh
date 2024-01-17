#!/bin/bash
clusters=$(kubectl config get-contexts -o name)

for cluster in $clusters ; do
    kubectl --context $cluster $@
done
