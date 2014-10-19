require 'pubnub'
require 'awesome_print'

class String
  def black;          "\033[30m#{self}\033[0m" end
  def red;            "\033[31m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
  def brown;          "\033[33m#{self}\033[0m" end
  def blue;           "\033[34m#{self}\033[0m" end
  def magenta;        "\033[35m#{self}\033[0m" end
  def cyan;           "\033[36m#{self}\033[0m" end
  def gray;           "\033[37m#{self}\033[0m" end
  def bg_black;       "\033[40m#{self}\0330m"  end
  def bg_red;         "\033[41m#{self}\033[0m" end
  def bg_green;       "\033[42m#{self}\033[0m" end
  def bg_brown;       "\033[43m#{self}\033[0m" end
  def bg_blue;        "\033[44m#{self}\033[0m" end
  def bg_magenta;     "\033[45m#{self}\033[0m" end
  def bg_cyan;        "\033[46m#{self}\033[0m" end
  def bg_gray;        "\033[47m#{self}\033[0m" end
  def bold;           "\033[1m#{self}\033[22m" end
  def reverse_color;  "\033[7m#{self}\033[27m" end
end

class DemoConsole

  OPTIONS = {
      :'1'  => :Publish,
      :'2'  => :Subscribe,
      :'3'  => :Presence,
      :'4'  => :Leave,
      :'5'  => :History,
      :'6'  => :PagedHistory,
      :'7'  => :HereNow,
      :'8'  => :WhereNow,
      :'9'  => :State,
      :'10' => :Heartbeat,
      :'11' => :Time,
      :'12' => :Audit,
      :'13' => :Grant,
      :'14' => :Revoke,
      :A    => :set_uuid,
      :B    => :set_auth_key,
      :C    => :show_state,
      :D    => :set_state,
      :EXIT => :exit
  }

  def initialize

    welcome

    keys_option = select_keys

    case keys_option.to_s
    when '1'
      @origin        = 'pubsub.pubnub.com'
      @subscribe_key = 'demo'
      @publish_key   = 'demo'
      @secret_key    = nil

    when '2'
      @origin        = 'pubsub.pubnub.com'
      @subscribe_key = 'sub-c-a478dd2a-c33d-11e2-883f-02ee2ddab7fe'
      @publish_key   = 'pub-c-a2650a22-deb1-44f5-aa87-1517049411d5'
      @secret_key    = 'sec-c-YjFmNzYzMGMtYmI3NC00NzJkLTlkYzYtY2MwMzI4YTJhNDVh'

    when '3'
      puts `clear`
      print_pubnub
      puts 'Okey, now you have to provide me your data or accept default:'.green
      print 'origin [pubsub.pubnub.com]: '
      @origin = gets.chomp!
      print 'subscribe_key [demo]: '
      @subscribe_key = gets.chomp!
      print 'publish_key [demo]: '
      @publish_key = gets.chomp!
      print 'secret_key (nil by default): '
      @secret_key = gets.chomp!

      @origin        = 'pubsub.pubnub.com' if @origin.blank?
      @subscribe_key = 'demo'           if @subscribe_key.blank?
      @publish_key   = 'demo'           if @publish_key.blank?
      @secret_key    = nil                 if @secret_key.blank?
    else
      @origin        = 'pubsub.pubnub.com'
      @subscribe_key = 'demo'
      @publish_key   = 'demo'
      @secret_key    = nil
    end

    set_uuid_and_auth

    my_logger = Logger.new(STDOUT)

    @pubnub = Pubnub.new(

      :subscribe_key  => @subscribe_key,
      :publish_key    => @publish_key,
      :secret_key     => @secret_key,
      :error_callback => method(:error_callback),
      :auth_key       => @auth_key,
      # :logger         => my_logger
    )

    @pubnub.set_uuid(@uuid) unless @uuid.blank?

    ap @pubnub

    start_console

  end

  def welcome
    puts `clear`
    puts "You have loaded #{Pubnub::VERSION} gem"
    puts `clear`
    print_pubnub
    puts 'Hello in interactive PubNub console!'
    puts 'Feel free to play around with it!'
    puts '--'
    puts '[Hit ENTER to continue]'
    gets
    puts `clear`
  end

  def select_keys
    print_pubnub
    puts 'Before we start, you have to select demo app keys or add your own.'.green
    print "\n"
    puts '1. Basic demo keys  -- You will be limited to standard events, no PAM features'
    puts '2. PAM supprot keys -- You can check out all pubnub features, including PAM'
    puts '3. Custom keys      -- If you already have your own keys, you can set them here'
    print "\n"
    print 'Your choice: '.green
    gets.chomp!
  end

  def set_uuid_and_auth
    puts `clear`
    print_pubnub
    puts 'You can set up now your uuid and auth_key: '.green
    print 'uuid [random_default]: '
    @uuid = gets.chomp!
    print 'auth_key (blank by default): '
    @auth_key = gets.chomp
  end

  def set_uuid(uuid)
    @pubnub.set_uuid(uuid)
  end

  def set_auth_key(auth_key)
    @pubnub.set_auth_key(auth_key)
  end

  def start_console
    puts `clear`
    print_pubnub
    puts 'CONSOLE STARTED!'.bg_green
    exit = false
    choice = false
    until exit
      until OPTIONS.keys.include?(choice)
        puts 'Choose your next operation (type \'exit\' to exit):'.green
        puts 'Events:'.green
        puts '1.  Publish'
        puts '2.  Subscribe'
        puts '3.  Presence'
        puts '4.  Leave (unsubscribe)'
        puts '5.  History'
        puts '6.  Paged History'
        puts '7.  HereNow'
        puts '8.  WhereNow'
        puts '9.  State'
        puts '10. Heartbeat'
        puts '11. Time'
        puts '12. Audit'  if @secret_key
        puts '13. Grant'  if @secret_key
        puts '14. Revoke' if @secret_key
        puts "\nPubnub::Client interaction:".green
        puts 'A. Set UUID'
        puts 'B. Set auth_key'
        puts 'C. Check state'
        puts 'D. Set state'
        print "\nYour choice: ".red
        choice = gets.chomp!.to_s.upcase.to_sym
      end
      choice = OPTIONS[choice]

      case choice
      when :exit
        exit = true
      when :Publish
        options = ask_about(:sync, :message, :channel)
        @pubnub.publish(options)
      when :Subscribe
        options = ask_about(:sync, :channel)
        @pubnub.subscribe(options)
      when :Presence
        options = ask_about(:sync, :channel)
        @pubnub.presence(options)
      when :Leave
        options = ask_about(:sync, :channel)
        @pubnub.leave(options)
      when :History
        options = ask_about(:sync, :channel, :reverse, :history_start, :history_end, :count)
        @pubnub.history(options)
      when :PagedHistory
        options = ask_about(:sync, :channel, :reverse, :history_start, :history_end, :limit, :page)
        @pubnub.paged_history(options)
      when :HereNow
        options = ask_about(:sync, :optional_channel)
        @pubnub.here_now(options)
      when :WhereNow
        options = ask_about(:sync, :uuid)
        @pubnub.where_now(options)
      when :State
        options = ask_about(:sync, :channel, :uuid)
        @pubnub.state(options)
      when :Heartbeat
        options = ask_about(:sync, :heartbeat, :channel)
        @pubnub.heartbeat(options)
      when :Time
        options = ask_about(:sync)
        @pubnub.time(options)
      when :Audit
        options = ask_about(:sync, :channel, :subscribe_key)
        @pubnub.audit(options)
      when :Grant
        options = ask_about(:sync, :channel, :subscribe_key, :read, :write)
        @pubnub.grant(options)
      when :Revoke
        options = ask_about(:sync, :channel, :subscribe_key, :read, :write)
        @pubnub.revoke(options)
      when :set_uuid
        print 'Your new uuid: '
        @pubnub.set_uuid(gets.chomp!)
      when :set_auth_key
        print 'Your new auth_key: '
        @pubnub.set_uuid(gets.chomp!)
      when :show_state
        ap @pubnub.env[:state]
      when :set_state
        options = ask_about(:sync, :channel)
        print 'State: '
        begin
          state = eval(gets.chomp!)
          options.merge!({ :state => state})
          @pubnub.set_state(options)
        rescue => e
          print 'ERROR! Invalid state.'.bg_red
          print e
        end
      end
      choice = nil
    end
  end

  # that adds callback method as :callback in options
  def ask_about(*things)
    options = {}
    things.each do |thing|
      case thing
      when :sync
        print 'Should event be async? '
        options[:http_sync] = !acceptance

      when :message
        while options[:message].blank?
          puts 'Write below message to publish:'
          options[:message] = gets.chomp!
        end

      when :channel
        while options[:channel].blank?
          print 'Specify channel(s): '
          options[:channel] = gets.chomp!
        end

      when :optional_channel
          print 'Specify channel(s) or leave blank for all channels (global here now): '
          options[:channel] = gets.chomp!

      when :limit
        while options[:limit].blank?
          print 'History limit?: '
          options[:limit] = gets.chomp!
        end

      when :reverse
        while options[:reverse].blank? && options[:reverse] != false
          print 'In reverse order?: '
          options[:reverse] = acceptance
        end

      when :history_start
        unless options[:reverse]
          # while options[:start].blank?
            print 'History start timetoken: '
            options[:start] = gets.chomp!
          # end
        end

      when :history_end
        unless options[:reverse]
          # while options[:end].blank?
            print 'History end timetoken: '
            options[:end] = gets.chomp!
          # end
        end

      when :count
        while options[:count].blank?
          print 'Count [100]: '
          options[:count] = gets.chomp!
          options[:count] = 100 if options[:count].blank?
        end

      when :uuid
        while options[:uuid].blank?
          print 'Enter uuid: '
          options[:uuid] = gets.chomp!
        end

      when :heartbeat
        while options[:heartbeat].blank?
          print 'Enter heartbeat rate: '
          options[:heartbeat] = gets.chomp!
        end

      when :subscribe_key
        while options[:subscribe_key].blank?
          print 'Enter subscribe key: '
          options[:subscribe_key] = gets.chomp!
        end

      when :read
        while options[:read].blank? && options[:read] != false
          print 'Read? '
          options[:read] = acceptance
        end

      when :write
        while options[:write].blank? && options[:write] != false
          print 'Write? '
          options[:write] = acceptance
        end

      when :limit
        while options[:limit].blank?
          print 'limit: '
          options[:limit] = gets.chomp!.to_i
        end

      when :page
        while options[:page].blank?
          print 'page: '
          options[:page] = gets.chomp!.to_i
        end
      end
    end
    options.merge({:callback => method(:callback)})
  end

  def acceptance
    %w(Y 1).include?(gets.chomp!.to_s.upcase)
  end

  def print_pubnub
    puts '
    __________     ___.     _______       ___.       ________       ________
    \______   \__ _\_ |__   \      \  __ _\_ |__     \_____  \     /  _____/
     |     ___/  |  \ __ \  /   |   \|  |  \ __ \      _(__  <    /   __  \
     |    |   |  |  / \_\ \/    |    \  |  / \_\ \    /       \   \  |__\  \
     |____|   |____/|___  /\____|__  /____/|___  /   /______  / /\ \_____  /
                        \/         \/          \/           \/  \/       \/

                                                         Pubnub Demo Console
    '.red
  end

  def callback(envelope)
    ap envelope.inspect
  end

  def connect_callback(data)
    puts 'Connection established'.bg_green
  end

  def error_callback(error)
    puts 'ERROR'.bg_red
    ap error
  end
end

DemoConsole.new
