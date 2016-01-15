module SigepWeb
  class SearchClient < WebServiceInterfaceApi
    def initialize(options = {})
      @id_contract = options[:id_contract]
      @id_post_card = options[:id_post_card]
      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate
      begin
        response = process(:busca_cliente, {
          idContrato: @id_contract,
          idCartaoPostagem: @id_post_card,
          usuario: authenticate.user,
          senha: authenticate.password
        }).to_hash[:busca_cliente_response][:return]

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
