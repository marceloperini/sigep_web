require 'sigep_web/version'
require 'sigep_web/configuration'
require 'sigep_web/web_service_interface_api'
require 'sigep_web/web_service_reverse_logistic_api'
require 'sigep_web/authenticate'
require 'sigep_web/service_availability'
require 'sigep_web/search_client'
require 'sigep_web/zip_query'
require 'sigep_web/request_labels'
require 'savon'
require 'nokogiri'

module SigepWeb
  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.service_availability(options = {})
    ServiceAvailability.new(options)
  end

  def self.search_client(options = {})
    SearchClient.new(options)
  end

  def self.zip_query(options = {})
    ZipQuery.new(options)
  end

  def self.request_labels(options = {})
    RequestLabels.new(options)
  end
end
