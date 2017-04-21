#!/bin/bash


# Set variables for the new account, database, and collection
resourceGroupName=myResourceGroup
location="South Central US"
name=docdb-test
ipRangeFilter="13.91.6.132,13.91.6.1/24"
databaseName=docdb-test-database
collectionName=docdb-test-collection

# Create a resource group
az group create \
	--name $resourceGroupName \
	--location $location

# Create a DocumentDB account
az documentdb create \
	--name $name \
	--resource-group $resourceGroupName \
	--ip-range-filter $ipRangeFilter \
	--kind GlobalDocumentDB \
	--locations $location  \
	--max-interval 10 \
	--max-staleness-prefix 200

# Create a DocumentDB database 
az documentdb add-database \
	--resource-group $resourceGroupName \
	--name $name \
	--dbname $databaseName \
    --locations "East US"

# Create a DocumentDB collection
az documentdb add-collection \
	--resource-group $resourceGroupName \
	--name $name \
	--dbname $databaseName \
	--collname $collectionName 
