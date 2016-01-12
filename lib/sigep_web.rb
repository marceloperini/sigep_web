require 'sigep_web/version'
require 'sigep_web/configuration'
require 'sigep_web/web_service_interface_api'
require 'sigep_web/web_service_reverse_logistic_api'
require 'sigep_web/authenticate'
require 'sigep_web/service_availability'
require 'savon'
require 'nokogiri'

module SigepWeb
  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
