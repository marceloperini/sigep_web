# frozen_string_literal: true

module SigepWeb
  class SearchClient < WebServiceInterfaceApi
    def initialize(id_contract:, id_post_card:)
      @id_contract = id_contract
      @id_post_card = id_post_card

      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate

      response = process(
        :busca_cliente,
        idContrato: id_contract,
        idCartaoPostagem: id_post_card,
        usuario: authenticate.user,
        senha: authenticate.password
      ).to_hash[:busca_cliente_response][:return]

      {success: true, response: response}
    rescue Savon::SOAPFault => e
      {success: false, error: e.message}
    end

    private

    attr_reader :id_contract, :id_post_card
  end
end
