module Bazinga
  class FourOhFourController
    def self.four_oh_four
      "Page not Found"
    end
  end
end

Bazinga::EventHandler.subscribe_to_event :four_oh_four, lambda {|options|
  Bazinga::FourOhFourController.four_oh_four
}
