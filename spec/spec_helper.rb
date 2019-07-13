$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

ENV['GEM_ENV'] = 'test'

require 'sigep_web'
require 'simplecov'
require 'vcr'
require 'factory_bot'

SimpleCov.start do
  add_filter '/spec/'
end

RSpec.configure do |config|
  config.filter_run_when_matching :focus

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end

