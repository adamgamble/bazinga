require 'rubygems'
require 'rack'
Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| load(f) }

module Bazinga
  class Server
    def initialize
      Bazinga::Logger.initalize_logging
      Bazinga::EventHandler.fire_event! :log, :message => "Bazinga Server started on localhost:3000"
    end

    def call(env)
      Bazinga::EventHandler.fire_event! :log, :message => "Request received: #{env['PATH_INFO']}"
      [200, {"Content-Type" => "text/html"}, [Bazinga::EventHandler.fire_event!(:web_request, :path => env['PATH_INFO'])]]
    end
  end
end
