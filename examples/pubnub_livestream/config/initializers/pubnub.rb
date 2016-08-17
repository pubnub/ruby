$pubnub = Pubnub.new(
    :publish_key   => 'demo',
    :subscribe_key => 'demo'
)

$callback = lambda do |envelope|
  Message.create(
      :author => envelope.msg['author'],
      :message => envelope.msg['message'],
      :timetoken => envelope.timetoken
  ) if envelope.msg['author'] && envelope.msg['message']
end
