module SigepWeb
  class CalculateDigitChecker < WebServiceReverseLogisticApi
    def initialize(options = {})
      @number = options[:number]
      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate

      begin
        response = process(:calcular_digito_verificador, {
          usuario: authenticate.user,
          senha: authenticate.password,
          codAdministrativo: authenticate.administrative_code,
          numero: @number
        }).to_hash[:calcular_digito_verificador_response][:return]

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
