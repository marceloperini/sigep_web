module SigepWeb
  class GenerateLabelsDigitVerifier < WebServiceInterfaceApi
    def initialize(options = {})
      @labels = options[:labels]
      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate
      begin
        process(:gera_digito_verificador_etiquetas, {
          etiquetas: @labels,
          usuario: authenticate.user,
          senha: authenticate.password
        }).to_hash[:gera_digito_verificador_etiquetas_response][:return]
      rescue Savon::SOAPFault => msg
        msg
      end
    end
  end
end
