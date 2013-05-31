require 'pubnub'

cb1 = lambda { |x| puts("cb1 says: #{x}") }
cb2 = lambda { |x| puts("cb2 says: #{x}") }

p = Pubnub.new(:subscribe_key => "demo", :publish_key => "demo")

p.subscribe(:channel => "a", :callback => cb1, :http_sync => true)
sleep(3)
p.subscribe(:channel => "ping_3", :callback => cb2, :http_sync => true)

while (1) do
  puts "chilling!"
  sleep(1)
end