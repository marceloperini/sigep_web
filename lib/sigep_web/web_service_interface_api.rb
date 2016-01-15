module SigepWeb
  class WebServiceInterfaceApi
    def initialize(options = {})
      if options[:encoding]
        @client = Savon.client({ wsdl: url, ssl_verify_mode: :none, encoding: options[:encoding] })
      else
        @client = Savon.client({ wsdl: url, ssl_verify_mode: :none })
      end
    end

    def process(method, message)
      @client.call(method, soap_action: "", message: message)
    end

    private
      def url
        if ENV['GEM_ENV'] == 'test'
          'https://apphom.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl'
        else
          'https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl'
        end
      end
  end
end
