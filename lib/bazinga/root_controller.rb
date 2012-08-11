module Bazinga
  class RootController
    def self.root_request
      "Hello Root"
    end
  end
end

Bazinga::EventHandler.subscribe_to_event :web_request, lambda {|options|
  if options[:path] == "/"
    Bazinga::RootController.root_request
  else
    ""
  end
}
