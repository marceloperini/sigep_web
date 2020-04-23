# frozen_string_literal: true

module SigepWeb
  class RequestLabels < WebServiceInterfaceApi
    def initialize(receiver_type:, identifier:, id_service:, qt_labels:)
      @receiver_type = receiver_type
      @identifier    = identifier
      @id_service    = id_service
      @qt_labels     = qt_labels

      super()
    end

    def request
      authenticate = SigepWeb.configuration.authenticate

      response = process(:solicita_etiquetas,
        tipoDestinatario: receiver_type,
        identificador: identifier,
        idServico: id_service,
        qtdEtiquetas: qt_labels,
        usuario: authenticate.user,
        senha: authenticate.password
      ).to_hash[:solicita_etiquetas_response][:return]

      { success: true, response: build_label_array(response) }
    rescue Savon::SOAPFault => exception
      { success: false, error: exception.message }
    end

    private

    attr_reader :receiver_type, :identifier, :id_service, :qt_labels

    def build_label_array(label_range)
      label_array = []
      start_label, end_label = label_range.split(',')
      prefix = start_label[0,2]
      suffix = start_label[11,12]
      number = start_label[2,8].to_i
      end_number = end_label[2,8].to_i

      while number <= end_number do
        use_number = number.to_s

        if use_number.size < 8
          use_number = ('0' * (8 - use_number.size)) + use_number
        end

        label_array.push prefix + use_number + ' ' + suffix
        number += 1
      end

      label_array
    end
  end
end

