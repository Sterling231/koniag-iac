param env string = 'dev'

module crmStorage 'modules/storage.bicep' = {
  name: 'crm-storage'
  params: {
    name: 'stcrm${env}${uniqueString(resourceGroup().id)}'
  }
}

output storageId string = crmStorage.outputs.id