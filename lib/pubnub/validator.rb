module Pubnub
  module Validator

    def valid_channel?(allow_array = true)
      valid = true
      if @channel.is_a? Array
        if allow_array
          @channel.each do |channel|
            unless channel.is_a?(String) || channel.is_a?(Symbol)
              valid = false
              break
            end
          end
        else
          valid = false
        end
      else
        if !@channel.is_a?(String) && !@channel.is_a?(Symbol)
          valid = false
        elsif @channel.to_s.index(',') && !allow_array
          valid = false
        end
      end

      valid

    end
  end
end
