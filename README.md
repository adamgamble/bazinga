# Bazinga

Web Framework based on events

This is just me toying with rack and events

To run it:

    rackup config.ru


    To respond to a certain path
    Bazinga::EventHandler.subscribe_to_event :web_request, lambda {|options|
      if options[:path] == "/"
        #Return a string containing output to send to the browser.
        #In this case i'm calling a method and returning its output
        Bazinga::RootController.root_request
      else
        ""
      end
    }

Responses from event subscriptions are concatenated and sent to the browser
