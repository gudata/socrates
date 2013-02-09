# encoding: UTF-8
# libs that we use

require "rubygems"
require "bundler/setup"

require 'mysql2'

require 'active_record'
require 'active_support'
require 'awesome_print'
require 'logger'
require 'require_all'
require 'progressbar'



require 'fastercsv'
require 'open-uri'
require 'awesome_nested_set'
require 'uri'
require 'cgi'
require 'choice'

require 'nokogiri'

require 'abstract'

# require other folders
# require_all 'app/voices'
#
require 'socrates/application.rb'


class Application < Socrates::Application

  PROGRAM_VERSION = '0.0.1'

  def run
    puts logo

    Choice.options do
      header ''
      header 'Specific options:'

      # option :port do
      #   short '-p'
      #   long '--port=PORT'
      #   desc 'The port to listen on (default 21)'
      #   cast Integer
      #   default 21
      # end

      separator ''
      separator 'Common options: '

      option :help do
        long '--help'
        desc 'Show this message'
      end

      option :version do
        short '-v'
        long '--version'
        desc 'Show version'
        action do
          puts "Socrates v#{PROGRAM_VERSION} included."
          exit
        end
      end
    end

  end

  def logo
    <<-LOGO
    _ _
    \\/our  logo
    ''

    LOGO
  end
end