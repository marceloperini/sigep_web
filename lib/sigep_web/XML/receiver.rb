module SigepWeb
  module XML
    class Receiver
      def initialize(builder, receiver)
        @builder = builder
        @receiver = receiver
      end

      def build_xml
        @builder.destinatario do
          @builder.nome_destinatario { @builder.cdata @receiver.name }
          @builder.telefone_destinatario { @builder.cdata @receiver.phone }
          @builder.celular_destinatario { @builder.cdata @receiver.cellphone }
          @builder.email_destinatario { @builder.cdata @receiver.email }
          @builder.logradouro_destinatario { @builder.cdata @receiver.address }
          @builder.complemento_destinatario { @builder.cdata @receiver.complement }
          @builder.numero_end_destinatario @receiver.number
        end

        @builder.nacional do
          @builder.bairro_destinatario { @builder.cdata @receiver.neighborhood }
          @builder.cidade_destinatario { @builder.cdata @receiver.city }
          @builder.uf_destinatario @receiver.uf
          @builder.cep_destinatario { @builder.cdata @receiver.cep }
          @builder.codigo_usuario_postal @receiver.user_postal_code
          @builder.centro_custo_cliente @receiver.cost_center_client
          @builder.numero_nota_fiscal @receiver.invoice_number
          @builder.serie_nota_fiscal @receiver.invoice_serie
          @builder.valor_nota_fiscal @receiver.invoice_value
          @builder.natureza_nota_fiscal @receiver.invoice_nature
          @builder.descricao_objeto { @builder.cdata @receiver.description_object }
          @builder.valor_a_cobrar @receiver.amount
        end
      end
    end
  end
end
