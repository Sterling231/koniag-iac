@description('Storage account name, 3-24 lowercase letters and numbers')
param name string
param location string = resourceGroup().location
@allowed(['Standard_LRS', 'Standard_ZRS'])
param sku string = 'Standard_LRS'

resource sa 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: name
  location: location
  sku: { name: sku }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    allowBlobPublicAccess: false
  }
  tags: { owner: 'platform', managedBy: 'bicep' }
}

output id string = sa.id