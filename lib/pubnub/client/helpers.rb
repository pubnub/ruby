# Toplevel Pubnub module.
module Pubnub
  # Pubnub client Class
  class Client
    # Module that holds some helper methods
    module Helpers
      private

      def totally_empty(hash)
        hash.reduce(true) { |acc, (_, v)| acc && v.is_a?(Hash) ? totally_empty(v) : false }
      end

      def setup_pools
        # Event pool
        @env[:events] = []

        # Connection pools
        @env[:single_event_conn_pool] = {}
        @env[:subscribe_event_conn_pool] = {}
        @env[:heartbeat_event_conn_pool] = {}

        # Callback pools.
        @env[:c_cb_pool] = {}
        @env[:e_cb_pool] = {}

        # Subscription and heartbeat pools.
        @env[:subscription_pool] = {}
        @env[:heartbeat_pool] = {}

        # Requests pool.
        @env[:req_dispatchers_pool] = {}
        @env[:req_dispatchers_pool][:sync] = {}
        @env[:req_dispatchers_pool][:async] = {}
      end

      def clean_env
        @env.delete_if { |_, v| v.blank? } # nillify if blank
      end
    end
  end
end
