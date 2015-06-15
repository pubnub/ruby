require 'pry'
require 'vcr'
require 'pubnub'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = {
      match_requests_on: [:method,
                          VCR.request_matchers.uri_without_param(:pnsdk, :uuid)]
  }
end

def format_value value
  if value.is_a? String
    "'#{value}'"
  elsif value.is_a? Symbol
    ":#{value}"
  else
    value
  end
end

# Prepare client

pubnub = Pubnub.new(
    :publish_key => 'pub-c-ef1905bd-3c9c-4bc7-9f20-f6ee1f50f79b',
    :subscribe_key => 'sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f',
    :secret_key => 'sec-c-ZWYwMGJiZTYtMTQwMC00NDQ5LWI0NmEtMzZiM2M5NThlOTJh',
    :error_callback => @error_callback
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
    # audit: {
    #     http_sync: [true, false],
    #     callback: [:block, :parameter],
    #     channel: ['demo_channel']
    # },
    # channel_registration: {
    #     http_sync: [true, false],
    #     callback: [:block, :parameter],
    # },
    # grant: {
    #     http_sync: [true, false],
    #     callback: [:block, :parameter],
    #     read: [true, false, :nil],
    #     write: [true, false, :nil],
    #     ttl: [0, 600, :nil],
    #     channel: ['demo_channel']
    # },
    # heartbeat: {
    #     http_sync: [true, false],
    #     callback: [:block, :parameter],
    # },
    # here_now: {
    #     http_sync: [true, false],
    #     callback: [:block, :parameter],
    # },
    history: {
        http_sync: [true, false],
        callback: [:block, :parameter],
        channel: [:channel, 'channel'],
        limit: [1, 10, 100],
        reverse: [true, false, :nil],
        start: [:nil, 14341271962242699, '14341271962242699'],
        end: [:nil, 14341271962242699, '14341271962242699']
    },
    # leave: {
    #     http_sync: [true, false],
    #     callback: [:block, :parameter],
    # },
    publish: {
        http_sync: [true, false],
        callback: [:block, :parameter],
        message: [:message, 'message', %w(me ssage), 100],
        channel: ['channel', :channel]
    },
    # revoke: {
    #     http_sync: [true, false],
    #     callback: [:block, :parameter],
    # },
    # state: {
    #     http_sync: [true, false],
    #     callback: [:block, :parameter],
    # },
    time: {
        http_sync: [true, false],
        callback: [:block, :parameter],
    },
    # where_now: {
    #     http_sync: [true, false],
    #     callback: [:block, :parameter]
    # }
}

events.each do |event, options|
  file = File.open("spec/examples/#{event}_examples_spec.rb", 'w')

  all_tests = []

  o_v = options.values
  possible_options = o_v.first.product(*o_v.drop(1))

  possible_options.each_with_index do |current_options, i|

    # Prepare values
    options_text = []
    parameters = []
    cassette_name = "#{event}"
    current_options.each_with_index do |current_option, j|
      unless current_option == :nil
        options_text << "#{options.keys[j]}: #{current_option}"
        parameters << "#{options.keys[j]}: #{format_value(current_option)}"
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

      parameters_prim.delete_if {|p| p.index('callback: ')}
      parameters_prim << 'callback: @callback'

      puts "working for parameters_prim: #{parameters.join(', ')}"


      fired_event = pubnub.send(event.to_s, eval("{#{parameters_prim.join(', ')}}"))

      fired_event = fired_event.value if fired_event.is_a? Celluloid::Future

      @expected_response = fired_event.map{ |e| e.response}.to_s
      @expected_message = fired_event.map{ |e| e.message}.to_s

    end

    if parameters.index('callback: :block')
      callback_block = true
      parameters.delete_if { |p| p == 'callback: :block' }
    else
      callback_block = false
      parameters.map! { |p| p == 'callback: :parameter' ? 'callback: @callback' : p }
    end

    if parameters.index('http_sync: true')
      http_sync = true
    else
      http_sync = false
    end


    example_text <<   "\nVCR.use_cassette('test_examples/#{cassette_name}', record: :once) do"

    if callback_block
      example_text <<     "\nevent = @pubnub.#{event}(#{parameters.join(', ')}, &@callback)"
    else
      example_text <<     "\nevent = @pubnub.#{event}(#{parameters.join(', ')})"
    end

    if http_sync
      example_text << "\nexpect(event.map{ |e| e.response}).to eq #{@expected_response}"
      example_text << "\nexpect(event.map{ |e| e.message}).to eq #{@expected_message}"
    else
      example_text << "\nexpect(event.value.map{ |e| e.response}).to eq #{@expected_response}"
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
      :secret_key => 'sec-c-ZWYwMGJiZTYtMTQwMC00NDQ5LWI0NmEtMzZiM2M5NThlOTJh',
      :error_callback => @error_callback
    )

    @pubnub.uuid = 'f0ac67ef-912f-4797-be67-a59745107306'

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