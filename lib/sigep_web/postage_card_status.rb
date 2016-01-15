module SigepWeb
  class PostageCardStatus < WebServiceInterfaceApi
    def initialize(options = {})
      @postage_number_card = options[:postage_number_card]
      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate
      begin
        process(:get_status_cartao_postagem, {
          numeroCartaoPostagem: @postage_number_card,
          usuario: authenticate.user,
          senha: authenticate.password
        }).to_hash[:get_status_cartao_postagem_response][:return]
      rescue Savon::SOAPFault => msg
        msg
      end
    end
  end
end
