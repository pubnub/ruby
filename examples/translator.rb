require 'pubnub'
require 'bing_translator'

PUBLISH_KEY   = 'demo'
SUBSCRIBE_KEY = 'demo'

BING_CLIENT_ID     = 'ruby_translator'
BING_CLIENT_SECRET = '0c60poc1ju6p4UMQcCBsysDPLA5wGe+tQFupCI9R6S8='

class PubMultiLangChatClient

  class Message
    @@translator = BingTranslator.new(BING_CLIENT_ID, BING_CLIENT_SECRET)

    attr_reader :username, :language

    def initialize(parameters)
      @language  = parameters['language']
      @message   = parameters['message']
      @username  = parameters['username']
    end

    def self.supported_language_codes
      @@translator.supported_language_codes
    end

    def to_hash
      {
          :language => @language,
          :message  => @message,
          :username => @username
      }
    end

    def translate(language)
      if @language && @language != language
        @message = @@translator.translate @message, :from => @language, :to => language
      end
      @message
    end
  end

  def error_callback(error)
    @logger.error "ERROR: #{error.inspect}"
  end

  def connect_callback(e)
    puts "Connected to room #{@room}"
    @client_connected = true
    print_prompt
  end

  def start
    initialize_client
    ask_about_username
    ask_about_room_number
    ask_about_language
    @pubnub_client.subscribe(
        :channel => "automated_translation_#{@room}",
        :callback => method(:handle_response)
    )
    puts 'Chat room opened...'
    start_chatting
  end

  def start_chatting
    while true
      msg = gets.chop!
      exit if msg == 'exit'
      message = Message.new('message' => msg, 'language' => @language, 'username' => @username)
      @pubnub_client.publish(:message => message.to_hash, :channel => "automated_translation_#{@room}"){|x|
        #print "// ok, send"
      } unless msg.blank?
      print_prompt
    end
  end

  def print_prompt
    print '> '
  end

  def initialize_client
    puts 'Initializing chat client...'
    @pubnub_client = Pubnub.new(:publish_key => PUBLISH_KEY,
                                :subscribe_key => SUBSCRIBE_KEY,
                                :connect_callback => method(:connect_callback)
    )
  end

  def ask_about_username
    while @username.blank?
      print 'Please, provide username: '
      @username = gets.chop!.to_s
    end
  end

  def ask_about_room_number
    while @room.nil? || @room < 1 || @room > 1000
      print 'Please, provide room number [1-1000]: '
      @room = gets.chop!.to_i
      if @room < 1 || @room > 1000
        puts 'Wrong room number.'
      end
    end
    puts 'Room number set.'
  end

  def ask_about_language
    lang_codes = Message.supported_language_codes
    while @language.nil? || !lang_codes.include?(@language)
      print 'Please, provide your native language code: '
      @language = gets.chop!
      unless lang_codes.include?(@language)
        puts 'Invalid language code, please, check out list of available language codes:'
        puts lang_codes.join(', ')
      end
    end
    puts 'Language set.'
  end

  def handle_response(envelope)
    message = Message.new envelope.msg.to_hash
    #puts envelope.msg
    print "#{message.username}[#{message.language}]: #{message.translate @language}\n" unless message.username == @username
  end
end

chat_client = PubMultiLangChatClient.new
chat_client.start