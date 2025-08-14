#!/bin/bash

RESOURCE_GROUP_NAME=terraform-state-rg
STAGE_SA_ACCOUNT=tfstagebackendprakhar
DEV_SA_ACCOUNT=tfdevbackendprakhar
CONTAINER_NAME=tfstate


# Create resource group
az group create --name terraform-state-rg --location centralindia

# Create storage account for staging environment
az storage account create --resource-group terraform-state-rg --name tfstagebackendprakhar --sku Standard_LRS --encryption-services blob

# Create storage account for dev environment
az storage account create --resource-group terraform-state-rg --name tfdevbackendprakhar --sku Standard_LRS --encryption-services blob

# Create blob container for staging environment
az storage container create --name tfstate --account-name tfstagebackendprakhar

# Create blob container for dev environment
az storage container create --name tfstate --account-name tfdevbackendprakhar