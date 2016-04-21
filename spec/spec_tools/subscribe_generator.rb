require 'pubnub'
require 'redis'
require 'vcr'
require 'pry'

def setup_cgs(pubnub)
  puts 'Setting channel groups...'
  pubnub.channel_registration(action: :add, channel: :rubytest,  group: :rubytest).value
  pubnub.channel_registration(action: :add, channel: :rubytest0, group: :rubytest0).value
  pubnub.channel_registration(action: :add, channel: :rubytest1, group: :rubytest1).value
  puts 'Done!'
end

def get_channels_for_publish(current_options)
  channels = []
  channels += [current_options[:channel]].flatten if current_options[:channel]
  channels += [:rubytest]                         if current_options[:group] == :rubytest
  channels += [:rubytest0, :rubytest1]            if current_options[:group] == [:rubytest0, :rubytest1]
  channels.map do |channel|
    if channel.to_s.index('*')
      'ruby.test'
    else
      channel
    end
  end
end

def get_channels_for_presence(current_options)
  channels = []
  channels += [current_options[:presence]].flatten if current_options[:presence]
  channels.map do |channel|
    if channel.to_s.index('*')
      'ruby.test'
    else
      channel
    end
  end
end

def what_it_does(options)
  'works fine with ' + options.map{|k, v| "#{k}_#{v}"}.join('_')
end

def format_options(options)
  options.to_s.gsub(/back"/, 'back').gsub(/back=>"/, 'back=>')
end

@logger = Logger.new('generator.log')

def get_new_pubnub
  Pubnub.new(subscribe_key: 'sub-c-9a20ffa4-0243-11e6-861b-02ee2ddab7fe', publish_key: 'pub-c-c617141c-b93e-4492-8b21-d6be4a9b009c', logger: @logger)
end

puts "\n\n#{Pubnub::VERSION}\n\n"


redis  = Redis.new

setup_cgs(get_new_pubnub)

@message_output = []
@callback = lambda { |envelope|
  @message_output << envelope.msg
}

@presence_message_output = []
@presence_callback = lambda { |envelope|
  @presence_message_output << envelope.msg
}

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = {
      match_requests_on: [:method,
                          VCR.request_matchers.uri_without_param(:pnsdk, :uuid)]
  }
end

options = {
    channel: [
        nil, :rubytest, 'rubytest', [:rubytest0, :rubytest1],
        'ruby.*', [:rubytest, 'ruby.*']
    ],
    group:             [nil, :rubytest, [:rubytest0, :rubytest1]],
    presence:          [nil, :rubytest, [:rubytest0, :rubytest1]],
    callback:          [:block, :parameter],
    presence_callback: [nil, :block, :parameter],
    ssl:               [true, false],
    http_sync:         [true]
}

values = options.values

possibilities = values.first.product(*values.drop(1))

# Delete possibilities where there's no channel and no group and no presence
possibilities.delete_if { |pos| pos[0].nil? && pos[1].nil? && pos[2].nil? }

text = []

possibilities.each_with_index do |options_array, i|
  puts "Generating test no. #{i}."

  # if File.exist?(Dir.pwd + "/fixtures/vcr_cassettes/test_examples/subscribe/#{i}.yml")
  #   puts 'Already exists, skipping.'
  #   next
  # end

  pubnub = get_new_pubnub

  current_options = {
      channel:           options_array[0],
      group:             options_array[1],
      presence:          options_array[2],
      callback:          options_array[3],
      presence_callback: options_array[4],
      ssl:               options_array[5],
      http_sync:         options_array[6]
  }

  puts 'Parameters used:'
  puts current_options

  options = current_options.clone

  case options[:callback]
    when :parameter
      options[:callback] = @callback
  end

  case options[:presence_callback]
    when :parameter
      options[:presence_callback] = @presence_callback
  end

  generator_options = options.clone
  generator_options.delete_if { |_k,v| v.nil? }
  generator_options[:callback]          = @callback          unless current_options[:callback].nil?
  generator_options[:presence_callback] = @presence_callback unless current_options[:presence_callback].nil?

  VCR.use_cassette("test_examples/subscribe/#{i}", record: :once) do

    channels_for_publish  = get_channels_for_publish(current_options)
    channels_for_presence = get_channels_for_presence(current_options)

    if generator_options[:http_sync]
      puts "Pubnub timetoken before: #{pubnub.env[:timetoken]}"
      pubnub.subscribe(generator_options)
      puts "Pubnub timetoken after 1st: #{pubnub.env[:timetoken]}"
      # redis.publish('publish', channels_for_publish.to_json)
      # redis.publish('subscribe', channels_for_presence.to_json)
      # sleep(1)
      pubnub.subscribe(generator_options)
      puts "Pubnub timetoken after 2nd: #{pubnub.env[:timetoken]}"
    else
      pubnub.subscribe(generator_options)
      # redis.publish('publish', channels_for_publish.to_json)
      # redis.publish('subscribe', channels_for_presence.to_json)
      # sleep(3)
      sleep(0.1)
    end

    current_subs = pubnub.subscribed_to

    current_subs[:channel].each do |channel|
      puts "Leaving channel #{channel}"
      pubnub.leave(channel: channel, http_sync: true)
      puts 'Channel left'
    end

    current_subs[:group].each do |group|
      puts "Leaving group #{group}"
      pubnub.leave(group: group, http_sync: true)
      puts 'Group left'
    end

    messages_output          = @message_output.clone
    presence_messages_output = @presence_message_output.clone

    @message_output          = []
    @presence_message_output = []

    options_for_text = current_options.clone
    case options_for_text[:callback]
      when :block
        options_for_text.delete(:callback)
      when :parameter
        options_for_text[:callback] = '@callback'
    end

    case options_for_text[:presence_callback]
      when nil
        options_for_text.delete(:presence_callback)
      when :block
        next
      when :parameter
        options_for_text[:presence_callback] = '@presence_callback'
    end

    text << "it '#{what_it_does(options_for_text)}' do"

    text << "  VCR.use_cassette('test_examples/subscribe/#{i}', record: :none) do"

    if options[:callback] == :block
      text << "    @pubnub.subscribe(#{format_options(options_for_text)}){ |e| @callback.call(e) }"
      text << "    @pubnub.subscribe(#{format_options(options_for_text)}){ |e| @callback.call(e) }" if options[:http_sync]
    else
      text << "    @pubnub.subscribe(#{format_options(options_for_text)})"
      text << "    @pubnub.subscribe(#{format_options(options_for_text)})" if options[:http_sync]
    end

    text << '  end'

    text << 'sleep 0.1'

    text << "expect(@message_output).to          eq #{messages_output}"
    text << "expect(@presence_message_output).to eq #{presence_messages_output}"

    text << 'end'

  end
end

file = File.open('spec/examples/subscribe_examples_spec.rb', 'w')

file.puts "
  require 'spec_helper'

  describe Pubnub::Subscribe do
  around(:each) do |example|
    @message_output = Array.new
    @presence_message_output = Array.new

    @callback = lambda do |envelope|
      @message_output << envelope.msg
    end

    @presence_callback = lambda do |envelope|
      @presence_message_output << envelope.msg
    end

    @pubnub = Pubnub.new(subscribe_key: 'sub-c-9a20ffa4-0243-11e6-861b-02ee2ddab7fe', publish_key: 'pub-c-c617141c-b93e-4492-8b21-d6be4a9b009c')


    Celluloid.boot
    example.run
    Celluloid.shutdown
  end"

file.puts text.join("\n")

file.puts 'end'

file.close
