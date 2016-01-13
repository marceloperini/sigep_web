module SigepWeb
  class RequestLabels < WebServiceInterfaceApi
    def initialize(options = {})
      @receiver_type = options[:receiver_type]
      @identifier    = options[:identifier]
      @id_service    = options[:id_service]
      @qt_labels     = options[:qt_labels]
      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate
      begin
        response = process(:solicita_etiquetas, {
          tipoDestinatario: @receiver_type,
          identificador: @identifier,
          idServico: @id_service,
          qtdEtiquetas: @qt_labels,
          usuario: authenticate.user,
          senha: authenticate.password
        }).to_hash[:solicita_etiquetas_response][:return]

        build_label_array(response)
      rescue Savon::SOAPFault => msg
        msg
      end
    end

    private
      def build_label_array(label_range)
        label_array = []
        label_range = label_range.split(',')
        label = label_range[0].to_s
        label_base = label.gsub(/[\d]/, '').split(' ')
        number = label.gsub(/[^\d]/, '').to_i

        while number <= label_range[1].gsub(/[^\d]/, '').to_i do
          label_array.push(label_base[0] + '0' + number.to_s + ' ' + label_base[1])

          number += 1
        end

        label_array
      end
  end
end
