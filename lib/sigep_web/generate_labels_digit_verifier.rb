module SigepWeb
  class GenerateLabelsDigitVerifier < WebServiceInterfaceApi
    def initialize(options = {})
      @labels = options[:labels]
      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate
      begin
        response = process(:gera_digito_verificador_etiquetas, {
          etiquetas: @labels,
          usuario: authenticate.user,
          senha: authenticate.password
        }).to_hash[:gera_digito_verificador_etiquetas_response][:return]

        {
          success: true,
          response: response
        }
      rescue Savon::SOAPFault => msg
        {
          success: false,
          error: msg
        }
      end
    end
  end
end
