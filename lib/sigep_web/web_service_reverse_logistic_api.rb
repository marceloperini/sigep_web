# frozen_string_literal: true

module SigepWeb
  class WebServiceReverseLogisticApi
    def initialize
      @client = Savon.client(
        wsdl: url,
        ssl_verify_mode: :none
      )
    end

    def process(method, message)
      @client.call(method, soap_action: "", message: message)
    end

    private

    def url
      if ENV["GEM_ENV"] == "test"
        "http://webservicescolhomologacao.correios.com.br/ScolWeb/WebServiceScol?wsdl"
      else
        "http://webservicescol.correios.com.br/ScolWeb/WebServiceScol?wsdl"
      end
    end
  end
end
