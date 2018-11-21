# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  add_filter ['.bundle', 'spec']
end

require File.expand_path(File.dirname(__FILE__) + '/../lib/sigep_web')

ENV['GEM_ENV'] = 'test'
