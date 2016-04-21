require 'pry'
require 'vcr'
require 'pubnub'

# Toplevel Pubnub module.
module Pubnub
  # Event module holds most basic and required infrastructure for every pubnub
  # event, there are also SingleEvent module and SubscribeEvent module
  class Event
    def set_timestamp
      @timestamp = current_time
      $timestamp = current_time
    end
  end
end

def format_value(value)
  if value.is_a? String
    "'#{value}'"
  elsif value.is_a? Symbol
    ":#{value}"
  else
    value
  end
end

# Other client to create some presence and messages
pubnub_client = Pubnub.new(
    :publish_key => 'pub-c-3b7455cb-acfe-4253-9273-f23248b30593',
    :subscribe_key => 'sub-c-777bcd44-f825-11e5-861b-02ee2ddab7fe',
    :secret_key => 'sec-c-MjRjYzVmNDUtZDJiNi00YTZmLTlhY2UtMzU3ZWE0ODU3MjMw',
    :uuid => 'john'
)

100.times do |i|
  pubnub_client.publish(channel: :channel, message: i, http_sync: true)
end

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = {
      match_requests_on: [:method,
                          VCR.request_matchers.uri_without_param(:pnsdk, :uuid)]
  }
end

# Prepare client

pubnub = Pubnub.new(
    :publish_key => 'pub-c-3b7455cb-acfe-4253-9273-f23248b30593',
    :subscribe_key => 'sub-c-777bcd44-f825-11e5-861b-02ee2ddab7fe',
    :secret_key => 'sec-c-MjRjYzVmNDUtZDJiNi00YTZmLTlhY2UtMzU3ZWE0ODU3MjMw',
    :error_callback => @error_callback,
    :uuid => 'gentest'
)

pubnub_wo_pam_client = Pubnub.new(
    :publish_key => 'pub-c-3b7455cb-acfe-4253-9273-f23248b30593',
    :subscribe_key => 'sub-c-777bcd44-f825-11e5-861b-02ee2ddab7fe',
    :secret_key => 'sec-c-MjRjYzVmNDUtZDJiNi00YTZmLTlhY2UtMzU3ZWE0ODU3MjMw',
    :uuid => 'gentest'
)


@callback = lambda { |envelope|
  @response_output.write envelope.response
  @message_output.write envelope.msg
  @after_callback = true
}

@response_output = StringIO.new
@message_output = StringIO.new

# Prepare possibilities

events = {
    audit: {
        http_sync: [true, false],
        callback: [:block, :parameter],
        channel: ['channel', :channel],
        'auth-key' => ['key', :key, 'key1, key2']
    },
    channel_registration: {
        http_sync: [true, false],
        callback: [:block, :parameter],
        channel: ['gchannel', :gchannel],
        group: ['group', :group],
        action: [:list_groups, 'list_groups', :get, 'get', :add, 'add', :remove]
    },
    grant: {
        http_sync: [true, false],
        callback: [:block, :parameter],
        read: [true, false, :nil],
        write: [true, false, :nil],
        ttl: [0, 600, :nil],
        channel: ['demo_channel']
    },
    here_now: {
        http_sync: [true, false],
        callback: [:block, :parameter],
        channel: [:nil, :channel, 'channel']
    },
    history: {
        http_sync: [true, false],
        callback: [:block, :parameter],
        channel: [:channel, 'channel'],
        limit: [1, 10, 100],
        reverse: [true, false, :nil],
        start: [:nil, 14350501874493930, '14350501874493930'],
        end: [:nil, 14350503487714362, '14350503487714362']
    },
    publish: {
        http_sync: [true, false],
        callback: [:block, :parameter],
        message: [:message, 'message', %w(me ssage), 100, {key: :value}],
        channel: ['channel', :channel]
    },
    revoke: {
        http_sync: [true, false],
        callback: [:block, :parameter],
        read: [true, false, :nil],
        write: [true, false, :nil],
        ttl: [0, 600, :nil],
        channel: ['demo_channel']
    },
    state: {
        http_sync: [true, false],
        callback: [:block, :parameter],
        uuid: ['uuid', :uuid],
        channel: ['channel', :channel, :nil]
    },
    time: {
        http_sync: [true, false],
        callback: [:block, :parameter],
    },
    where_now: {
        http_sync: [true, false],
        callback: [:block, :parameter],
        uuid: ['john', :john]
    }
}

events.each do |event, options|
  # file = File.open("spec/examples/#{event}_examples_spec.rb", 'w')

  all_tests = []

  o_v = options.values
  possible_options = o_v.first.product(*o_v.drop(1))

  possible_options.each_with_index do |current_options, i|

    # Prepare values
    options_text = []
    parameters = []
    cassette_name = "#{event}-#{rand(10000)}"
    current_options.each_with_index do |current_option, j|
      unless current_option == :nil
        options_text << "#{options.keys[j]}: #{current_option}"
        parameters << "'#{options.keys[j]}' => #{format_value(current_option)}"
        cassette_name << "_#{options.keys[j]}_#{current_option}"
      end
    end

    example_text = 'it \''
    example_text << options_text.join(', ')
    example_text << "' do"

    # run actual code before generating text for code

    VCR.use_cassette("test_examples/#{cassette_name}", record: :once) do


      parameters_prim = parameters.dup

      puts "working for parameters     : #{parameters.join(', ')}"

      parameters_prim.delete_if {|p| p.index('callback')}
      parameters_prim << "'callback' => @callback"

      puts "working for parameters_prim: #{parameters_prim.join(', ')}"

      if event == :channel_registration
        fired_event = pubnub_wo_pam_client.send(event.to_s, eval("{#{parameters_prim.join(', ')}}"))
      else
        fired_event = pubnub.send(event.to_s, eval("{#{parameters_prim.join(', ')}}"))
      end

      fired_event = fired_event.value if fired_event.is_a? Celluloid::Future

      @expected_response = fired_event.map{ |e| e.response}.to_s
      @expected_message = fired_event.map{ |e| e.message}.to_s

      puts "TIMESTAMP #{$timestamp}"

    end

    if parameters.index("'callback' => :block")
      callback_block = true
      parameters.delete_if { |p| p == "'callback' => :block" }
    else
      callback_block = false
      parameters.map! { |p| p == "'callback': :parameter" ? "'callback' => @callback" : p }
    end

    if parameters.index('http_sync: true')
      http_sync = true
    else
      http_sync = false
    end

    example_text << "\nPubnub::#{Pubnub::Formatter.classify_method(event.to_s)}.any_instance.stub(:current_time).and_return #{$timestamp}" if %w(audit revoke grant).include?(event.to_s)

    example_text <<   "\nVCR.use_cassette('test_examples/#{cassette_name}', record: :once) do"

    if event == :channel_registration
      if callback_block
        example_text <<     "\nevent = @pubnub_wo_pam_client.#{event}(#{parameters.join(', ')}, &@callback)"
      else
        example_text <<     "\nevent = @pubnub_wo_pam_client.#{event}(#{parameters.join(', ')})"
      end
    else
      if callback_block
        example_text <<     "\nevent = @pubnub.#{event}(#{parameters.join(', ')}, &@callback)"
      else
        example_text <<     "\nevent = @pubnub.#{event}(#{parameters.join(', ')})"
      end
    end


    if http_sync
      example_text << "\nexpect(event.map{ |e| e.response}).to eq #{@expected_response}" unless event == :history
      example_text << "\nexpect(event.map{ |e| e.message}).to eq #{@expected_message}"
    else
      example_text << "\nexpect(event.value.map{ |e| e.response}).to eq #{@expected_response}" unless event == :history
      example_text << "\nexpect(event.value.map{ |e| e.message}).to eq #{@expected_message}"
    end

    # example_text <<     "\n event.value"
    # example_text <<     "\neventually do"
    #
    # example_text <<       "\n@response_output.seek 0"
    # example_text <<       "\n@response_output.read.should eq '#{@expected_response}'"
    # example_text <<       "\n@message_output.seek 0"
    # example_text <<       "\n@message_output.read.should eq '#{@expected_message}'"
    #
    # example_text <<     "\nend"

    example_text <<   "\nend"
    example_text << "\nend\n"

    all_tests << example_text
  end

test_string = <<EOS
require 'spec_helper'

describe Pubnub::#{Pubnub::Formatter.classify_method(event.to_s)} do
  around(:each) do |example|
    @response_output = StringIO.new
    @message_output = StringIO.new

    @callback = lambda { |envelope|
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_callback = true
    }

    @pubnub = Pubnub.new(
      :publish_key => 'pub-c-ef1905bd-3c9c-4bc7-9f20-f6ee1f50f79b',
      :subscribe_key => 'sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f',
      :secret_key => 'sec-c-OTA5NzI1YTMtOWEyNy00NTQzLTkzNzMtMjY3ZDlkYzk0NGU3',
      :error_callback => @error_callback
    )

    @pubnub_wo_pam_client = Pubnub.new(
        :publish_key => 'pub-c-bda4e37b-f383-4acf-affd-cd8e66ed523b',
        :subscribe_key => 'sub-c-243e56aa-1b13-11e5-a5e2-02ee2ddab7fe',
        :secret_key => 'sec-c-OThjZDUyNjktY2ZlMS00MDc2LWJkODYtMmU4ZTk2MjY5ZGQ5',
        :uuid => 'gentest'
    )

    @pubnub.uuid = 'gentest'

    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  #{all_tests.join("\n")}

end

EOS

  file.puts test_string
  file.close
end
