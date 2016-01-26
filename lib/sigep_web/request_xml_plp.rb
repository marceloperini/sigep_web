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

        response
      rescue Savon::SOAPFault => msg
        {
          success: false,
          error: msg
        }
      end
    end
  end
end