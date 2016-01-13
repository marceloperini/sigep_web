module SigepWeb
  module XML
    class AdditionalService
      def initialize(builder, additional_service)
        @builder            = builder
        @additional_service = additional_service
      end

      def build_xml
        @builder.servico_adicional do
          @additional_service.codes.each do |code|
            @builder.codigo_servico_adicional code
          end

          @builder.valor_declarado @additional_service.declareted_value
        end
      end
    end
  end
end
