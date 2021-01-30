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
# AWS. Set your API keys in-app secrets manager
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

echo -e "* You can use any cloud cli tool to scale UP or DOWN clusters...\n"

# AWS. Authentication from env variables, scale your cluster
aws autoscaling update-auto-scaling-group --desired-capacity=4 \
--auto-scaling-group-name my-auto-scaling-group --health-check-type ELB \
--health-check-grace-period 60 || echo "ERROR: did you set your creds in the secret manager?"

# Google Cloud. Activate Google Service Account, set project, resize your group of servers
gcloud auth activate-service-account --key-file=/tmp/google-auth.json
gcloud config set account $(gcloud auth list --format="value(account)")
gcloud compute instance-groups managed resize NAME --size=4 || echo "ERROR: did you set your creds in the secret manager?"

# Azure Cloud. See https://lnx.azurewebsites.net/non-interactive-login-in-azure-cli-2-0/
az appservice plan update --number-of-workers 2 --name AppServiceManualScalePlan \
--resource-group myResourceGroup || echo "ERROR: did you set your creds in the secret manager?"
