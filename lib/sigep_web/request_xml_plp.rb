# frozen_string_literal: true

module SigepWeb
  class RequestXmlPlp < WebServiceInterfaceApi
    def initialize(id_plp:)
      @id_plp = id_plp

      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate

      response = process(
        :solicita_xml_plp,
        idPlpMaster: id_plp,
        usuario: authenticate.user,
        senha: authenticate.password
      ).to_hash[:solicita_xml_plp_response][:return]

      {success: true, response: response}
    rescue Savon::SOAPFault => e
      {success: false, error: e.message}
    end

    private

    attr_reader :id_plp
  end
end
