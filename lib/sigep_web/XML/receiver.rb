module SigepWeb
  module XML
    class Receiver
      def initialize(builder, receiver)
        @builder = builder
        @receiver = receiver
      end

      def build_xml
        @builder.destinatario do
          @builder.nome_destinatario @receiver.name
          @builder.telefone_destinatario @receiver.phone
          @builder.celular_destinatario @receiver.cellphone
          @builder.email_destinatario @receiver.email
          @builder.logradouro_destinatario @receiver.address
          @builder.complemento_destinatario @receiver.complement
          @builder.numero_end_destinatario @receiver.number
        end
      end
    end
  end
end
