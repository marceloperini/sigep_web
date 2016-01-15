module SigepWeb
  class RequestPlpServices < WebServiceInterfaceApi
    def initialize(options = {})
      @plp = options[:plp]
      @id_plp_client = options[:id_plp_client]
      #@post_card = options[:post_card]
      @labels = options[:labels]
      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate
      begin
        process(:fecha_plp_varios_servicos, {
          xml: @plp.to_xml,
          idPlpCliente: @id_plp_client,
          cartaoPostagem: authenticate.card,
          listaEtiquetas: @labels,
          usuario: authenticate.user,
          senha: authenticate.password
        }).to_hash[:fecha_plp_varios_servicos_response][:return].to_s
      rescue Savon::SOAPFault => msg
        msg
      end
    end
  end
end
