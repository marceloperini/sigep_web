module SigepWeb
  class ServiceAvailability < WebServiceInterfaceApi
    def initialize(options = {})
      @service_number = options[:service_number]
      @source_zip     = options[:source_zip]
      @target_zip     = options[:target_zip]
      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate
      process(:verifica_disponibilidade_servico, {
        codAdministrativo: authenticate.administrative_code,
        numeroServico: @service_number,
        cepOrigem: @source_zip,
        cepDestino: @target_zip,
        usuario: authenticate.user,
        senha: authenticate.password
      }).to_hash[:verifica_disponibilidade_servico_response][:return]
    end
  end
end
