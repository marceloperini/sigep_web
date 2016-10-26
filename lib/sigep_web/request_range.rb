module SigepWeb
  class RequestRange < WebServiceReverseLogisticApi
    def initialize(options = {})
      @type = options[:type]
      @service = options[:service]
      @quantity = options[:quantity]
      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate

      begin
        response = process(:solicitar_range, {
          usuario: authenticate.user,
          senha: authenticate.password,
          codAdministrativo: authenticate.administrative_code,
          contrato: authenticate.contract,
          tipo: @type,
          servico: @service,
          quantidade: @quantity
        }).to_hash[:solicitar_range_response][:return]

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
