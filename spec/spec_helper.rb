require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# For accurate test coverage measurements, require your code AFTER 'SimpleCov.start'

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end


# Setting environmental variable RACK_ENV
ENV['RACK_ENV'] = 'test'

# Requiring the Sinatra app file, capybara, capybara/rspec and rspec
require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'rspec'

# Telling capybara about my app class
Capybara.app = BookmarkManager

# Requiring web helpers file
require File.join(File.dirname(__FILE__), './features', 'web_helpers.rb')