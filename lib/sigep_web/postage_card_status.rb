# frozen_string_literal: true

module SigepWeb
  class PostageCardStatus < WebServiceInterfaceApi
    def initialize(postage_number_card:)
      @postage_number_card = postage_number_card

      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate

      response = process(
        :get_status_cartao_postagem,
        numeroCartaoPostagem: @postage_number_card,
        usuario: authenticate.user,
        senha: authenticate.password
      ).to_hash[:get_status_cartao_postagem_response][:return]

      {success: true, response: response}
    rescue Savon::SOAPFault => e
      {success: false, error: e.message}
    end
  end
end
