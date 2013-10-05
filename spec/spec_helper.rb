unless ENV['CLI_OPTIONS'] == 'no-coverage'
  require 'simplecov'
  SimpleCov.start do
    add_filter "/spec/"
  end
end

require "rspec/pride"

RSpec.configure do |config|
  config.color = true
  config.order = 'random'
end
