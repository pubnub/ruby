ParameterType(
  name:        'resourceType',
  regexp:      /CHANNEL|CHANNEL_GROUP|UUID/,
  type:        String,
  transformer: ->(s) { s }
)

ParameterType(
  name:        'permissionType',
  regexp:      /READ|WRITE|GET|MANAGE|UPDATE|JOIN|DELETE|/,
  type:        String,
  transformer: ->(s) { s }
)


