module Bazinga
  class Logger
    def self.log! message
      puts message
      File.open("log/main.log", "a") {|f| f.write message + "\n" rescue nil }
    end

    def self.initalize_logging
      Bazinga::EventHandler.subscribe_to_event :log, lambda{|options| Bazinga::Logger.log! options[:message] }
    end
  end
end
