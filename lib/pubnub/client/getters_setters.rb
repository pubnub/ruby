require 'pubnub/validators/common_validator'

# Toplevel Pubnub module.
module Pubnub
  # Pubnub client Class
  class Client
    # Module that holds some getters and setters
    module GettersSetters

      def sdk_version
        "PubNub-Ruby/#{Pubnub::VERSION}"
      end

      # Parameters:
      # ===========
      # <dl>
      #   <dt>uuid</dt>
      #   <dd>New uuid to be set. Note that this will override user_id value</dd>
      # </dl>
      #
      # Returns:
      # ========
      # New uuid.
      #
      # Functionality:
      # ==============
      # Can't change uuid while subscribed. You have to leave every subscribed channel.
      def change_uuid(uuid)
        change_user_id(uuid)
      end
      deprecate :change_uuid, :change_user_id, 2023, 1

      # Parameters:
      # ===========
      # <dl>
      #   <dt>user_id</dt>
      #   <dd>New user_id to be set. Note that this will override uuid value</dd>
      # </dl>
      #
      # Returns:
      # ========
      # New user_id.
      #
      # Functionality:
      # ==============
      # Can't change user_id while subscribed. You have to leave every subscribed channel.
      def change_user_id(user_id)
        Pubnub.logger.debug('Pubnub::Client') { 'Changing user_id' }
        raise('Cannot change user_id while subscribed.') if subscribed?
        Validator::Client.validate_user_id user_id

        @env[:uuid] = user_id
      end

      alias session_uuid= change_user_id
      alias uuid= change_user_id
      alias set_uuid= change_user_id
      alias session_user_id= change_user_id
      alias user_id= change_user_id
      alias set_user_id= change_user_id

      # Returns:
      # ========
      # Current origin.
      def current_origin
        @env[:origin]
      end

      alias origin current_origin

      # Returns:
      # ========
      # Origin that was set.
      def origin=(origin)
        @env[:origin] = origin
      end

      # Returns:
      # ========
      # Current client timetoken
      def timetoken
        @env[:timetoken]
      end

      # Retruns:
      # ========
      # Current region or default '0'
      def region_code
        @env[:region_code] || 0
      end

      # Parameters:
      # ===========
      # <dl>
      #   <dt>region</dt>
      #   <dd>New region.</dd>
      # </dl>
      # Returns:
      # ========
      # New region.
      def region_code=(region)
        @env[:region_code] = region
      end

      # Parameters:
      # ===========
      # <dl>
      #   <dt>timetoken</dt>
      #   <dd>New timetoken.</dd>
      # </dl>
      # Returns:
      # ========
      # New timetoken.
      def timetoken=(timetoken)
        @env[:timetoken] = timetoken
      end

      # Returns:
      # ========
      # Current uuid.
      def uuid
        user_id
      end
      deprecate :uuid, :user_id, 2023, 1

      # Returns:
      # ========
      # Current user_id.
      def user_id
        @env[:uuid]
      end

      # Returns:
      # ========
      # Array of all current events.
      # :nocov:
      def events
        @env[:events]
      end

      # :nocov:

      def current_heartbeat
        @env[:heartbeat].to_i
      end

      def heartbeat=(value)
        @env[:heartbeat] = value
      end

      def subscribe_filter=(filter_exp)
        @subscriber.reset if subscribed?
        @env[:subscribe_filter] = filter_exp
      end

      def subscribe_filter
        @env[:subscribe_filter]
      end
    end
  end
end
