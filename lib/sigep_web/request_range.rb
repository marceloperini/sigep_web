# frozen_string_literal: true

module SigepWeb
  class RequestRange < WebServiceReverseLogisticApi
    def initialize(type:, service:, quantity:)
      @type = type
      @service = service
      @quantity = quantity

      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate

      response = process(:solicitar_range,
        usuario: authenticate.user,
        senha: authenticate.password,
        codAdministrativo: authenticate.administrative_code,
        contrato: authenticate.contract,
        tipo: type,
        servico: service,
        quantidade: quantity
      ).to_hash[:solicitar_range_response][:return]

      if response[:cod_erro] == '0'
        { success: true, response: response }
      else
        { success: false, error: response[:msg_erro] }
      end
    rescue Savon::SOAPFault => e
      { success: false, error: e.message }
    end

    private

    attr_reader :type, :service, :quantity
  end
end

