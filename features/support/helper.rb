def has_permission(perms, permission_type)
  current_perm = nil
  eval "current_perm = Pubnub::Permissions.res(#{permission_type.downcase}: true).calculate_bitmask"
  perms & current_perm != 0
end

def prepare_permissions_map(grants, resource_type)
  grants
    .select { |_, value|
      value[:resource_type] == resource_type
    }
    .to_h { |name, value|
      empty_permissions = if value[:pattern]
                            Pubnub::Permissions.pat
                          else
                            Pubnub::Permissions.res
                          end
      permissions = value[:permission_type].reduce(empty_permissions) { |accumulated_permissions, string_perm|
        accumulated_permissions.instance_variable_set("@" + string_perm.downcase, true)
        accumulated_permissions
      }
      [name, permissions]
    }
end

def call_grant_token(pubnub, grant_token_state)
  pubnub.grant_token(
    ttl: grant_token_state[:ttl],
    http_sync: true,
    channels: prepare_permissions_map(grant_token_state[:current_grant], "CHANNEL"),
    channel_groups: prepare_permissions_map(grant_token_state[:current_grant], "CHANNEL_GROUP"),
    uuids: prepare_permissions_map(grant_token_state[:current_grant], "UUID"),
    authorized_uuid: grant_token_state[:authorized_uuid]
  )
end

def parse_error_body(error_response)
  Pubnub::Formatter.parse_json(error_response.result[:server_response].body)[0]
end
