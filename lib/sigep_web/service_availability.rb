# frozen_string_literal: true

module SigepWeb
  class ServiceAvailability < WebServiceInterfaceApi
    def initialize(service_number:, source_zip:, target_zip:)
      @service_number = service_number
      @source_zip = source_zip
      @target_zip = target_zip

      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate

      response = process(
        :verifica_disponibilidade_servico,
        codAdministrativo: authenticate.administrative_code,
        numeroServico: service_number,
        cepOrigem: source_zip,
        cepDestino: target_zip,
        usuario: authenticate.user,
        senha: authenticate.password
      ).to_hash[:verifica_disponibilidade_servico_response][:return]

      {success: true, response: response}
    rescue Savon::SOAPFault => e
      {success: false, error: e.message}
    end

    private

    attr_reader :service_number, :source_zip, :target_zip
  end
end
