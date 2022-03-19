#!/bin/bash

# AUTHENTICATION
# You can authenticate with your cloud account by injecting the right environment variables in your environment.
# IS NOT recommended to expose credentials within the scripts, only for tests purposes. 
# The best practice is to use your secret manager within the app and attach your Kubernetes config file.
echo "==================================="
echo "==      kubectl example         ==="
echo "==     View Kubernetes pods     ==="
echo "==================================="
sleep 1
echo -e "* Simple kubectl client  demo..."
echo ""
echo "kubectl version --client=true"
echo "kubectl config get-contexts"
# Select your context or use the default
echo "kubectl config use-context thiscluster"
sleep 1
echo "kubectl get nodes -o wide" 
echo ""
echo -e "\n* Please attach your kubecfg file in your secrets manager"
echo ""
echo "## END OF EXECUTION ##"