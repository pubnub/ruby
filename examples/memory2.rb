require 'pubnub'
require 'pry'

p = Pubnub.new(
    publish_key: 'pub-c-15d6fd3c-05de-4abc-8eba-6595a441959d',
    subscribe_key: 'sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe',
    secret_key: 'sec-c-ZWYwMGJiZTYtMTQwMC00NDQ5LWI0NmEtMzZiM2M5NThlOTJh',
    error_callback: lambda {|_e|}
)

p.grant(channel: :sometest){|e| puts e.msg}

50_000.times do
  p.publish(channel: :sometest, message: :somemessage){ |e| puts e.msg }
end

binding.pry

a = 2+2