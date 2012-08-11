# Bazinga

Web Framework based on events

To run it:

    rackup config.ru


    To respond to a certain path
    Bazinga::EventHandler.subscribe_to_event :web_request, lambda {|options|
      if options[:path] == "/"
        Bazinga::RootController.root_request
      else
        ""
      end
    }
