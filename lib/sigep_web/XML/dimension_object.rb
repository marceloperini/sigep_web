# frozen_string_literal: true

module SigepWeb
  module XML
    class DimensionObject
      def initialize(builder, dimension_object)
        @builder          = builder
        @dimension_object = dimension_object
      end

      def build_xml
        @builder.dimensao_objeto do
          @builder.tipo_objeto @dimension_object.object_type
          @builder.dimensao_altura @dimension_object.height
          @builder.dimensao_largura @dimension_object.width
          @builder.dimensao_comprimento @dimension_object.length
          @builder.dimensao_diametro @dimension_object.diameter
        end
      end
    end
  end
end

