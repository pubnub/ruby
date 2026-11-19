require 'pubnub'

pubnub = Pubnub.new(
  subscribe_key: 'demo',
  publish_key: 'demo',
  secret_key: 'demo',
  user_id: 'myUniqueUserId'
)

# snippet.grantTokenWithCategories
# Grants `my-authorized-user-id` permission to list all channel metadata and all uuid metadata.
# Category permissions support only the `get` operation.
envelope = pubnub.grant_token(
  ttl: 15,
  authorized_user_id: 'my-authorized-user-id',
  categories: {
    channels: Pubnub::Permissions.cat(get: true),
    uuids: Pubnub::Permissions.cat(get: true)
  },
  http_sync: true
)

puts envelope.result[:data][:token]
# snippet.end

# snippet.parseTokenWithCategories
# Decodes a token that was granted with category permissions.
# The `cat` section holds the permission bitmask for each category: `chan` for channel
# metadata and `uuid` for uuid metadata. The `get` permission has the value 32.
parsed_token = pubnub.parse_token('use-token-string-generated-by-grant_token')

categories = parsed_token['cat']
puts "Channel metadata category: #{categories['chan']}"
puts "Uuid metadata category: #{categories['uuid']}"
# snippet.end

# snippet.grantWithCategories
# Grants the auth key permission to list all channel metadata and all uuid metadata.
# This legacy `grant` method requires the secret key to be set on the client.
envelope = pubnub.grant(
  categories: %w[channels uuids],
  auth_key: 'my-auth-key',
  get: true,
  ttl: 15,
  http_sync: true
)

puts envelope.status
# snippet.end
