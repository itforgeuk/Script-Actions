#!/bin/bash

# AUTHENTICATION
# You can authenticate with your cloud account by injecting the right environment variables in your environment.
# IS NOT recommended to expose credentials within the scripts, only for tests purposes. 
# The best practice is to use your secret manager within the app and attach your Kubernetes config file.

echo -e "* Simple kubectl client  demo..."

if [ "$VPNKEY" != "" ]; then
    # VPN key exist, give some time for the connection to be initiated
    sleep 6
fi
kubectl version --client=true
kubectl config get-contexts
# Select your context or use the default
# kubectl config use-context thiscluster
kubectl get nodes -o wide || echo -e "\n* Please attach your kubecfg file in your secrets manager"
