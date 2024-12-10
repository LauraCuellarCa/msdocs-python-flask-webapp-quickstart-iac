param name string
param location string
param serverFarmResourceId string
param containerRegistryName string
param containerRegistryImageName string
param containerRegistryImageVersion string


resource webApp 'Microsoft.Web/sites@2021-02-01' = {
  name: name
  location: location
  properties: {
    serverFarmId: serverFarmResourceId
    siteConfig: {
      linuxFxVersion: 'DOCKER|${containerRegistryName}.azurecr.io/${containerRegistryImageName}:${containerRegistryImageVersion}'
      appCommandLine: ''
    }
    appSettings: {
      WEBSITES_ENABLE_APP_SERVICE_STORAGE: 'false'
      DOCKER_REGISTRY_SERVER_URL: 'https://${containerRegistryName}.azurecr.io'
      DOCKER_REGISTRY_SERVER_USERNAME: '$(acrAdminUsername)' // Referencing the admin username for authentication
      DOCKER_REGISTRY_SERVER_PASSWORD: '$(acrAdminPassword)' // Referencing the admin password for authentication
    }
  }
}

