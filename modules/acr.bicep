param name string
param location string

resource acr 'Microsoft.ContainerRegistry/registries@2021-12-01' = {
  name: name
  location: location
  properties: {
    sku: {
      name: 'Basic'
    }
    adminUserEnabled: true
  }
}
