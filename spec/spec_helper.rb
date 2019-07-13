$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sigep_web'
require 'simplecov'
require 'vcr'
# require 'coveralls'
# Coveralls.wear!

SimpleCov.start do
  add_filter '/spec/'
end

ENV['GEM_ENV'] = 'test'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run_when_matching :focus
end

