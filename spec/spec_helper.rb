$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sigep_web'
require 'simplecov'
require 'coveralls'
Coveralls.wear!

SimpleCov.start do
    add_filter "/spec/"
end

ENV['GEM_ENV'] = 'test'
