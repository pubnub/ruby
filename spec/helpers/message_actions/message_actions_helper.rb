require 'helpers/spec_helper'


# Prepare data which should be used with get / remove message action tests.
#
# @param [Pubnub] client Instance which should be used to make preparations.
# @param [String] channel Name of channel with which message actions should work.
# @param [Integer] messages_count Number of messages which should be published and used with message actions.
# @param [Integer] actions_count Number of actions which should be published in total (it is better to be larger than messages_count).
# @param [Boolean] recording Whether VCR recording currently in progress or not.
# @return [[Array, Array]] Tuple with message and action timetokens.
def prepare_message_actions_test(client, channel, messages_count, actions_count, recording = false)
  action_values = %w[smile angry surprised lol check tada firework]
  action_types = %w[emotion_type_1 emotion_type_2 emotion_type_3 emotion_type_4]
  publish_timetokens = Array.new
  action_actions = Array.new

  # Publish messages for which
  (1..messages_count).each { |index|
    publish_timetokens.push(client.publish(channel: channel, message: "Hello world #{index}", http_sync: true).timetoken.to_i)
    sleep rand(1..2) if recording
  }

  # Attach message actions to published messages.
  (1..actions_count).each { |index|
    action_actions.push(client.add_message_action(
      channel: channel,
      type: action_types[index % action_types.length],
      value: action_values[index % action_values.length],
      message_timetoken: publish_timetokens[index % publish_timetokens.length],
      http_sync: true
    ).result[:data][:action_timetoken])
    sleep rand(1..2) if recording
  }

  [publish_timetokens, action_actions]
end