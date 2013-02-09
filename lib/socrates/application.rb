module Socrates
  class Application

    def root
      Socrates::Application::root
    end

    def env
      Socrates::Application::env
    end

    def get_connection_string
      Socrates::Application::env
    end

    def logger
      @@logger
    end

    class << self
      def logger
        return @@logger if defined? @@logger
        ActiveRecord::Base.logger = Logger.new(STDERR)
        @@logger = Logger.new(STDOUT) # Logger.new('logfile.log')
        @@logger.level = Logger::DEBUG
        @@logger
      end

      def root
        @@root ||= File.expand_path("../../../", __FILE__)
      end

      def env
        @@env = ENV['SOCRATES_ENV'] || 'development'
      end

      def get_connection_string
        #    Dir[File.join(File.dirname(__FILE__), 'lib', 'models', '*.rb')].each {|file| require file }
        database_configuration = File.join(self.root, 'config', 'database.yml')
        Socrates::Application::logger.info "connecting to #{database_configuration.inspect} - #{Socrates::Application::env}"

        YAML::load(File.open(database_configuration))[Socrates::Application::env]
      end
    end

    def initialize
      ActiveRecord::Base.establish_connection(Socrates::Application::get_connection_string)
      require_all 'app/models'
    end

  end
end