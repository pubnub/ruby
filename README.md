<img width="1920" height="600" alt="ruby-header" src="https://github.com/user-attachments/assets/ddf7134b-804c-48d6-aa74-cc67ee5aab94" />

# PubNub Ruby SDK

[![Gem Version](https://img.shields.io/gem/v/pubnub.svg)](https://rubygems.org/gems/pubnub)

PubNub provides global infrastructure for real-time, interactive applications.

Publish and receive messages in Ruby. Use this SDK for Ruby server, command-line, and backend applications.

[Documentation](https://www.pubnub.com/docs/sdks/ruby) · [API reference](https://www.pubnub.com/docs/sdks/ruby/api-reference/publish-and-subscribe) · [Changelog](https://www.pubnub.com/docs/sdks/ruby/changelog) · [Support](https://support.pubnub.com/)

## Requirements

| Requirement | Supported version or setup |
| --- | --- |
| Ruby | [Ruby 3.0.0 or later](https://github.com/pubnub/ruby/blob/master/pubnub.gemspec) |
| Dependency manager | RubyGems or Bundler. Install the `pubnub` gem directly or declare it in the application's Gemfile. |

## Installation

From the Ruby environment:

```sh
gem install pubnub
```

For other installation methods, see [environment setup](https://www.pubnub.com/docs/sdks/ruby).

## Quickstart

This example runs in a Ruby CLI application. It subscribes to `hello_world`, publishes one message, and prints the received text.

### Get your keys

1. Open the [PubNub Admin Portal](https://admin.pubnub.com/).
2. Create an app and a keyset for development, or select an existing development keyset.
3. Copy its publish key and subscribe key.

If Access Manager is enabled, obtain a token from your trusted backend and call `pubnub.set_token(token)`. Keep the secret key on the backend.

### Send and receive a message

Create `app.rb` in the project root and add:

Replace the key placeholders. Use a User ID that identifies the user or device in your app.

```ruby
require 'pubnub'

pubnub = Pubnub.new(
  subscribe_key: 'YOUR_SUBSCRIBE_KEY',
  publish_key: 'YOUR_PUBLISH_KEY',
  user_id: 'hello-world-user'
)

received = Queue.new
published = false

callback = Pubnub::SubscribeCallback.new(
  message: ->(envelope) do
    puts envelope.result[:data][:message]
    received << true
  end,

  status: ->(envelope) do
    if !published && !envelope.error?
      published = true

      pubnub.publish(
        channel: 'hello_world',
        message: 'Hello world'
      )
    end
  end
)

pubnub.add_listener(callback: callback)

pubnub.subscribe(
  channels: ['hello_world']
)

received.pop

pubnub.unsubscribe(
  channels: ['hello_world']
)
```

### Run the example

```sh
ruby app.rb
```

The terminal should show:

```
Hello world
```

The example unsubscribes from `hello_world` after receiving the message, and the script then exits.

For a complete application, see the [getting started guide](https://www.pubnub.com/docs/sdks/ruby).

## Next steps

| Task | Documentation |
| --- | --- |
| Configure the client | [Configuration](https://www.pubnub.com/docs/sdks/ruby/api-reference/configuration) |
| Work with subscriptions and messages | [Publish & Subscribe](https://www.pubnub.com/docs/sdks/ruby/api-reference/publish-and-subscribe) |
| Check channel occupancy | [Presence](https://www.pubnub.com/docs/sdks/ruby/api-reference/presence) |
| Read message history | [Message Persistence](https://www.pubnub.com/docs/sdks/ruby/api-reference/storage-and-playback) |

## Build with an AI coding assistant

The [PubNub MCP server](https://www.pubnub.com/docs/ai/pubnub-mcp-server) gives an AI coding assistant access to PubNub SDK documentation and PubNub APIs. Connect the assistant to the hosted server at `https://mcp.pubnub.com`, or run `npx @pubnub/mcp@latest` locally.

The [server repository](https://github.com/pubnub/pubnub-mcp-server) has setup steps for VS Code, Cursor, Claude Code, Claude Desktop, Codex, Gemini CLI, and OpenCode.

## Before production

Use [Access Manager](https://www.pubnub.com/docs/sdks/ruby/api-reference/access-manager) to grant each client the permissions it needs. Keep the secret key on your backend. Never include it in a distributed client.

Reuse the PubNub client for the owning service/application lifetime. Call `pubnub.unsubscribe(channels: [...])` for channel subscriptions that are no longer needed.

Live delivery through PubNub SDKs is at-most-once. A subscriber can miss messages while disconnected or if its buffer overflows. For longer-gap recovery, see [Message Persistence](https://www.pubnub.com/docs/sdks/ruby/api-reference/storage-and-playback).

## Troubleshooting

| Symptom | Check |
| --- | --- |
| Ruby loads a different PubNub gem version than the application expects | When using Bundler, declare `gem 'pubnub'` in the Gemfile and run the application with `bundle exec ruby app.rb`. See the [Ruby SDK guide](https://www.pubnub.com/docs/sdks/ruby). |
| A publish succeeds but no message appears | Check the message handler, subscription readiness, keyset, and channel name. |
| The process continues running after the owning workflow ends | Unsubscribe channels that are no longer needed with `pubnub.unsubscribe(channels: [...])`. See [Ruby troubleshooting](https://www.pubnub.com/docs/sdks/ruby/troubleshoot). |
| Extra clients or duplicate messages during development | For long-running Ruby servers/workers, create the PubNub client at application/service scope rather than on each request or code reload. |

For setup help, see [troubleshooting](https://www.pubnub.com/docs/sdks/ruby/troubleshoot). Check [network status](https://status.pubnub.com/) for service incidents.

## Releases

Read the [changelog](https://www.pubnub.com/docs/sdks/ruby/changelog) before upgrading.

For a major version change, review the [Ruby SDK changelog](https://www.pubnub.com/docs/sdks/ruby/changelog) for breaking changes before upgrading.

## Support and contributions

For setup or account help, contact [PubNub Support](https://support.pubnub.com/).

For a reproducible SDK bug, use [GitHub Issues](https://github.com/pubnub/ruby/issues). Include the SDK version, runtime, and a small reproduction with credentials removed.

Install the repository development dependencies, run the test suite, and include tests for behavioral changes before opening a pull request.

## License

See the [PubNub Software Development Kit License](https://github.com/pubnub/ruby/blob/master/LICENSE.txt).
