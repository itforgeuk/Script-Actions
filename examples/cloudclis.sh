#!/bin/bash

# Use case example:
# You own Kubernetes clusters, your auto-scaling didn't work and you need emergency capacity?

# Cloud CLI tools official documentation:
# https://aws.amazon.com/cli/
# https://cloud.google.com/sdk/gcloud
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli

# AUTHENTICATION:
# You can authenticate with your cloud account by injecting the right environment variables in your environment.
# IS NOT recommended to expose credentials within the scripts, only for tests purposes. 
# The best practice is to use your secret manager within the app with the right key names, for example:
#
# AWS. Set your API keys in your script (WARNING for AWS you cannot set them in the app's secret manager)
# AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxx
# AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# AWS_DEFAULT_REGION=us-west-2
#
# Google Service Account
# https://cloud.google.com/docs/authentication/production
# Attach your JSON service account key file in-app secrets manager
#
# Azure Service Principal
# https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?toc=%2Fazure%2Fazure-resource-manager%2Ftoc.json&view=azure-cli-latest
# https://lnx.azurewebsites.net/non-interactive-login-in-azure-cli-2-0/
# Create a service principal with the az ad sp create-for-rbac command. 
# When creating a service principal, you choose the type of sign-in authentication it uses.
# For AKS, first login locally with "az login", then generate a new kubeconfig with az aks get-credentials -n $AKS_NAME -g $RESGROUP --admin -f ~/.kube/config --overwrite-existing

echo "==================================="
echo "==      Cloud CLIs example      ==="
echo "==     Use scaling commands     ==="
echo "==================================="
sleep 1
echo -e "* You can use any cloud cli tool to scale UP or DOWN clusters...\n"

# AWS. Authentication from env variables, scale your cluster
echo "ERROR: did you set your creds in your scripts?"
echo "aws autoscaling update-auto-scaling-group --desired-capacity=4 \
--auto-scaling-group-name my-auto-scaling-group --health-check-type ELB \
--health-check-grace-period 60"
echo ""
sleep 1
# Google Cloud. Activate Google Service Account, set project, resize your group of servers
echo "ERROR: did you set your creds in the secret manager?"
echo 'gcloud auth activate-service-account --key-file=/tmp/google-auth.json'
echo 'gcloud config set account $(gcloud auth list --format="value(account)")'
echo '-> Scale my cluster to 4 nodes...'
echo 'gcloud compute instance-groups managed resize NAME --size=4'
echo ""
sleep 1
# Azure Cloud. See https://lnx.azurewebsites.net/non-interactive-login-in-azure-cli-2-0/
echo "ERROR: did you set your creds in the secret manager?"
echo 'az appservice plan update --number-of-workers 2 --name AppServiceManualScalePlan \
--resource-group myResourceGroup'
echo ""
echo "## END OF EXECUTION ##"