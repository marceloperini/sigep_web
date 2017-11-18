$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sigep_web'
require 'simplecov'
SimpleCov.start
require 'coveralls'
Coveralls.wear!

ENV['GEM_ENV'] = 'test'
