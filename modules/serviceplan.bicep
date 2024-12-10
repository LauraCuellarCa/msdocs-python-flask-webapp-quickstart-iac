param name string
param location string

resource servicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: name
  location: location
  properties: {
    sku: {
      capacity: 1
      family: 'B'
      name: 'B1'
      size: 'B1'
      tier: 'Basic'
    }
    kind: 'Linux'
    reserved: true
  }
}

// Output for the service plan's resource ID
output id string = servicePlan.id

