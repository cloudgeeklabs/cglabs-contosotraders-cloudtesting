## Configure SubscriptionId
$subscriptionId = '4d896b5e-7fb5-46c7-9b09-b36f0cd96f9e'

## Setup Account
[void](az account set -s $subscriptionId)


## Configure Required Providers
(az provider register -n Microsoft.OperationsManagement -c)
(az provider register -n Microsoft.Cdn -c)
(az provider register -n Microsoft.Chaos -c)


## Create AppRegistation and set to Owner on target subscription
$authJson = (az ad sp create-for-rbac -n temp-contosotraders-sp --role Owner --scopes /subscriptions/$subscriptionId --sdk-auth)

## Configure GitHub Secrets
