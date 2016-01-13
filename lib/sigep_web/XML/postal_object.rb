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
          @builder.codigo_servico_postagem postal_object.postage_code_service
          @builder.cubagem postal_object.cubage
          @builder.peso postal_object.weight

          XML::Receiver.new(@builder, postal_object.receiver).build_xml
          XML::National.new(@builder, postal_object.national).build_xml
          XML::AdditionalService.new(@builder, postal_object.additional_services).build_xml
          XML::DimensionObject.new(@builder, postal_object.dimension_object).build_xml

          @builder.status_processamento postal_object.processing_status
        end
    end
  end
end
