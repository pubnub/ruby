# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for History event
    module MessageCounts
      include CommonValidator

      def validate!
        return if @skip_validate
        validate_channel!
      end

      private

      def validate_channel!
        chans = @channels
        if @channels.is_a? String
          chans = @channels.split(',')
        end

        tokens = @timetokens

        if tokens.length == 0
          raise(
              ArgumentError.new(
                  object: self,
                  message: 'Either single :timetoken or multiple timetokens equaling to number of channels given must be provided.'
              ),
              'Either single :timetoken or multiple timetokens equaling to number of channels given must be provided.'
          )
        elsif tokens.length > 1 and tokens.length != chans.length
          raise(
              ArgumentError.new(
                  object: self,
                  message: 'Number of :timetoken elements must be 1 or same as number of provided channels.'
              ),
              'Number of :timetoken elements must be 1 or same as number of provided channels.'
          )
        end
      end
    end
  end
end
