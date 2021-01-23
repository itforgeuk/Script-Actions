#!/bin/bash

# Case example:
# You own Kubernetes clusters, your auto-scaling didn't work and you need emergency capacity?

# AUTHENTICATION
# You can authenticate with your cloud account by injecting the right environment variables in your environment.
# IS NOT recommended to expose credentials within the scripts, only for tests purposes. 
# The best practice is to use your secret manager within the app with the right key names, for example:
#
# AWS #
# AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxx
# AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# AWS_DEFAULT_REGION=us-west-2
#
# Google Service Account (TODO: support) #
# https://cloud.google.com/docs/authentication/production
# GOOGLE_APPLICATION_CREDENTIALS=""
#
# Azure Service Principal (TODO: support) #
# https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?toc=%2Fazure%2Fazure-resource-manager%2Ftoc.json&view=azure-cli-latest
# Create a service principal with the az ad sp create-for-rbac command. 
# When creating a service principal, you choose the type of sign-in authentication it uses.

# Cloud CLI tools official documentation:
# https://aws.amazon.com/cli/
# https://cloud.google.com/sdk/gcloud
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli

echo -e "* You can use any cloud cli tool to scale UP or DOWN clusters...\n"

aws autoscaling update-auto-scaling-group --desired-capacity=4 \
--auto-scaling-group-name my-auto-scaling-group --health-check-type ELB \
--health-check-grace-period 60 || echo "ERROR: did you set your creds in the secret manager?"

gcloud compute instance-groups managed resize NAME --size=4 || echo "ERROR: did you set your creds in the secret manager?"

az appservice plan update --number-of-workers 2 --name AppServiceManualScalePlan \
--resource-group myResourceGroup || echo "ERROR: did you set your creds in the secret manager?"
