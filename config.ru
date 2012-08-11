load 'server.rb'
Rack::Handler::Mongrel.run Bazinga::Server.new, :Port => 3000
