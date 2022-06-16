# frozen_string_literal: true

module SigepWeb
  module XML
    class AdditionalService
      def initialize(builder, additional_service)
        @builder = builder
        @additional_service = additional_service
      end

      def build_xml
        @builder.servico_adicional do
          if @additional_service
            @additional_service.codes.each do |code|
              @builder.codigo_servico_adicional code
            end

            @builder.codigo_servico_adicional "025"

            @builder.valor_declarado @additional_service.declareted_value
          end
        end
      end
    end
  end
end
