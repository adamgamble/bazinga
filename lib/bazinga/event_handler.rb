module Bazinga
  class EventHandler
    @@events = {}
    DEFAULT_EVENT_HASH = {:subscriptions => [], :event_lambda => lambda{|a, options| a.call(options)}}

    def self.events
      @@events
    end

    def self.create_event event_name, event_lambda
      @@events[event_name] = DEFAULT_EVENT_HASH.dup unless @@events.has_key?(event_name)
      @@events[event_name][:event_lambda] = event_lambda
    end

    def self.subscribe_to_event event_name, subscription_lambda
      @@events[event_name] = DEFAULT_EVENT_HASH.dup unless @@events.has_key?(event_name)
      @@events[event_name][:subscriptions] << subscription_lambda
    end

    def self.fire_event! event_name, options = {}
      return unless @@events.has_key?(event_name)
      response = ""
      @@events[event_name][:subscriptions].each do |sub_lambda|
        response += @@events[event_name][:event_lambda].call(sub_lambda, options).to_s
      end
      response
    end
  end
end
