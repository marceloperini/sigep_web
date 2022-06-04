# frozen_string_literal: true

module SigepWeb
  class CalculateDigitChecker < WebServiceReverseLogisticApi
    def initialize(number:)
      @number = number

      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate

      response = process(
        :calcular_digito_verificador,
        usuario: authenticate.user,
        senha: authenticate.password,
        codAdministrativo: authenticate.administrative_code,
        numero: number
      ).to_hash[:calcular_digito_verificador_response][:return]

      if response[:cod_erro] == "0"
        {success: true, response: response}
      else
        {success: false, error: response}
      end
    rescue Savon::SOAPFault => exception
      {success: false, error: exception.message}
    end

    private

    attr_reader :number
  end
end
