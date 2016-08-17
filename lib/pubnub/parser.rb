module Pubnub
  class Parser
    # Parses string to JSON
    def self.parse_json(string)
      begin
        return JSON.parse(string)
      rescue JSON::ParserError => e
        return Pubnub::Envelope.format_after_json_error(string, e)
      end
    end

    def self.valid_json?(string)
      begin
        JSON.parse(string)
        true
      rescue JSON::ParserError
        false
      end
    end
  end
end