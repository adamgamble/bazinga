module Bazinga
  class EventHandler
    @@events = Hash.new { |hash, key| hash[key] = {:subscriptions => [], :event_lambda => lambda{|a, options| a.call(options)}} }

    def self.events
      @@events
    end

    def self.create_event event_name, event_lambda
      @@events[event_name][:event_lambda] = event_lambda
    end

    def self.subscribe_to_event event_name, subscription_lambda
      EventHandler.fire_event! :log, :message => "Something subscribed to #{event_name}"
      @@events[event_name][:subscriptions] << subscription_lambda
    end

    def self.fire_event! event_name, options = {}
      EventHandler.fire_event! :log, :message => "Event Fired! #{event_name} - #{options.to_s}" unless event_name == :log
      response = ""
      @@events[event_name][:subscriptions].each do |sub_lambda|
        response += @@events[event_name][:event_lambda].call(sub_lambda, options).to_s
      end
      response
    end
  end
end
