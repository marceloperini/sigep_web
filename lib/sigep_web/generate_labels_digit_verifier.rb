# frozen_string_literal: true

module SigepWeb
  class GenerateLabelsDigitVerifier < WebServiceInterfaceApi
    def initialize(labels:)
      @labels = labels

      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate

      response = process(:gera_digito_verificador_etiquetas,
        etiquetas: labels,
        usuario: authenticate.user,
        senha: authenticate.password
      ).to_hash[:gera_digito_verificador_etiquetas_response][:return]

      { success: true, response: response }
    rescue Savon::SOAPFault => exception
      { success: false, error: exception.message }
    end

    private

    attr_reader :labels
  end
end

