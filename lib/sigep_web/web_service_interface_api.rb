module SigepWeb
  class WebServiceInterfaceApi
    def initialize
      @client = Savon.client({ wsdl: url, ssl_verify_mode: :none })
    end

    def url
      @url ||= if ENV['GEM_ENV'] == 'test'
                 'https://apphom.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl'
               else
                 'https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl'
               end
    end
  end
end
