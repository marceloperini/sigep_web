module SigepWeb
  module XML
    class National
      def initialize(builder, national)
        @builder  = builder
        @national = national
      end

      def build_xml
        @builder.nacional do
          @builder.bairro_destinatario @national.neighborhood
          @builder.cidade_destinatario @national.city
          @builder.uf_destinatario @national.uf
          @builder.cep_destinatario @national.cep
          @builder.codigo_usuario_postal @national.user_postal_code
          @builder.centro_custo_cliente @national.cost_center_client
          @builder.numero_nota_fiscal @national.invoice_number
          @builder.serie_nota_fiscal @national.invoice_serie
          @builder.valor_nota_fiscal @national.invoice_value
          @builder.descricao_objeto @national.description_object
          @builder.valor_a_cobrar @national.amount
        end
      end
    end
  end
end
