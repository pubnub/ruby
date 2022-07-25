require "spec_helper"

describe "Custom retries" do
  around :each do |example|
    example.run_with_retry retry: 10
  end

  before(:each) do
    @pubnub = Pubnub.new(
      subscribe_key: "sub-a-mock-key",
      publish_key: "pub-a-mock-key",
      secret_key: "sec-a-mock-key",
      user_id: "ruby-test-client",
    )
  end

  # it 'allows you to grant on failure and retry' do
  #   allow_any_instance_of(Pubnub::Grant).to receive(:current_time).and_return 1457358289
  #
  #   @error_envelope, @success_envelope = nil, nil
  #
  #   publish_callback = ->(envelope) do
  #     # Check if envelope is error, when it is, it grants right to publish on given channel (if it was forbidden) and repeats publishing.
  #     if envelope.error?
  #       @error_envelope = envelope
  #       @pubnub.grant(channel: 'without-access', http_sync: true) if envelope.message == 'Forbidden'
  #       envelope.repeat(@pubnub)
  #     else #success
  #       @success_envelope = envelope
  #     end
  #   end
  #
  #   VCR.use_cassette('custom_retries/allows-grant-on-failure-and-retry', :record => :once) do
  #     @pubnub.publish(channel: 'without-access', message: 'I want to publish here!', callback: publish_callback, http_sync: true)
  #   end
  #
  #   # Inspect error_envelope
  #   expect(@error_envelope.message).to eq 'Forbidden'
  #   expect(@error_envelope.channel).to eq 'without-access'
  #   expect(@error_envelope.event).to eq :publish
  #   expect(@error_envelope.payload).to eq ({'channels' => ['without-access']})
  #   expect(@error_envelope.response).to eq "{\"message\":\"Forbidden\",\"payload\":{\"channels\":[\"without-access\"]},\"error\":true,\"service\":\"Access Manager\",\"status\":403}\n"
  #   expect(@error_envelope.service).to eq 'Access Manager'
  #   expect(@error_envelope.status).to eq 403
  #
  #   # Inspect success_envelope
  #   expect(@success_envelope.channel).to eq 'without-access'
  #   expect(@success_envelope.event).to eq :publish
  #   expect(@success_envelope.message).to eq 'I want to publish here!'
  #   expect(@success_envelope.parsed_response).to eq  [1, 'Sent', '14573583203711342']
  #   expect(@success_envelope.response).to eq "[1,\"Sent\",\"14573583203711342\"]"
  #   expect(@success_envelope.response_message).to eq 'Sent'
  #   expect(@success_envelope.status).to eq 200
  #   expect(@success_envelope.timetoken).to eq '14573583203711342'
  # end

end
