module SigepWeb
  class WebServiceInterfaceApi
    def initialize
      @client = Savon.client({
        wsdl: url,
        ssl_verify_mode: :none
      })
    end

    def process(method, message)
      @client.call(method, soap_action: '', message: message)
    end

    private

    def url
      if test_env?
        'https://apphom.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl'
      else
        'https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl'
      end
    end

    def test_env?
      (defined?(Rails) && ENV['RAILS_ENV'] == 'test') || ENV['GEM_ENV'] == 'test'
    end
  end
end
