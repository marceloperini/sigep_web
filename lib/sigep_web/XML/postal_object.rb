# frozen_string_literal: true

module SigepWeb
  module XML
    class PostalObject
      def initialize(builder, postal_objects = [])
        @builder = builder
        @postal_objects = postal_objects
      end

      def build_xml
        @postal_objects.each do |postal_object|
          @builder.objeto_postal do
            build_object(postal_object)
          end
        end
      end

      private

      def build_object(postal_object)
        @builder.numero_etiqueta postal_object.label_number
        @builder.codigo_objeto_cliente
        @builder.codigo_servico_postagem postal_object.postage_code_service
        @builder.cubagem postal_object.cubage
        @builder.peso postal_object.weight
        @builder.rt1
        @builder.rt2

        XML::Receiver.new(@builder, postal_object.receiver).build_xml

        @builder.servico_adicional do
          @builder.codigo_servico_adicional "025"

          if postal_object.additional_service_codes
            postal_object.additional_service_codes.each do |code|
              @builder.codigo_servico_adicional code
            end
          end

          @builder.valor_declarado postal_object.additional_services_declared_value
        end

        XML::DimensionObject.new(@builder, postal_object.dimension_object).build_xml

        @builder.data_postagem_sara
        @builder.status_processamento postal_object.processing_status
        @builder.numero_comprovante_postagem
        @builder.valor_cobrado
      end
    end
  end
end

