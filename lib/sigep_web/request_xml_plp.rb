# frozen_string_literal: true

module SigepWeb
  class RequestXmlPlp < WebServiceInterfaceApi
    def initialize(options = {})
      @id_plp   = options[:id_plp]

      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate

      begin
        response = process(:solicita_xml_plp, {
          idPlpMaster: @id_plp,
          usuario: authenticate.user,
          senha: authenticate.password
        }).to_hash[:solicita_xml_plp_response][:return]

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

