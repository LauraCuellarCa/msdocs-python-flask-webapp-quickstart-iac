param location string = 'westeurope' // Updated region for Spain
param acrName string = 'lauraContainerRegistry' // Name of the Azure Container Registry
param servicePlanName string = 'lauraServicePlan' // Name of the Azure Service Plan
param webAppName string = 'lauraWebApp' // Name of the Azure Web App
param containerRegistryImageName string = 'flask-demo' // Name of your container image
param containerRegistryImageVersion string = 'latest' // Version tag of your container image

// Define the Azure Container Registry (ACR)
module acrModule './modules/acr.bicep' = {
  name: 'acrDeployment'
  params: {
    name: acrName
    location: location
  }
}

// Define the Azure Service Plan for Linux
module servicePlanModule './modules/serviceplan.bicep' = {
  name: 'servicePlanDeployment'
  params: {
    name: servicePlanName
    location: location
  }
}

// Define the Azure Web App for Linux Containers
module webAppModule './modules/webapp.bicep' = {
  name: 'webAppDeployment'
  params: {
    name: webAppName
    location: location
    serverFarmResourceId: servicePlanModule.outputs.id
    containerRegistryName: acrName
    containerRegistryImageName: containerRegistryImageName
    containerRegistryImageVersion: containerRegistryImageVersion
  }
}

