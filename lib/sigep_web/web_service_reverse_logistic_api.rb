module SigepWeb
  class WebServiceReverseLogisticApi
    def initialize
      @client = Savon.client({ wsdl: url })
    end

    def url
      @url ||= if ENV['GEM_ENV'] == 'test'
                 'http://webservicescolhomologacao.correios.com.br/ScolWeb/WebServiceScol?wsdl'
               else
                 'http://webservicescol.correios.com.br/ScolWeb/WebServiceScol?wsdl'
               end
    end
  end
end
