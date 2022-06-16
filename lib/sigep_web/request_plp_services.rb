# frozen_string_literal: true

module SigepWeb
  class RequestPlpServices < WebServiceInterfaceApi
    def initialize(plp:, id_plp_client:, labels:)
      @plp = plp
      @id_plp_client = id_plp_client
      @labels = labels

      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate

      response = process(
        :fecha_plp_varios_servicos,
        xml: plp.to_xml,
        idPlpCliente: id_plp_client,
        cartaoPostagem: authenticate.card,
        listaEtiquetas: labels,
        usuario: authenticate.user,
        senha: authenticate.password
      ).to_hash[:fecha_plp_varios_servicos_response][:return].to_s

      {success: true, response: response}
    rescue Savon::SOAPFault => e
      {success: false, error: e.message}
    end

    private

    attr_reader :plp, :id_plp_client, :labels
  end
end
