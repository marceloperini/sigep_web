module SigepWeb
  module Models
    class PostalObject
      attr_accessor :label_number, :postage_code_service, :cubage,
        :weight, :receiver, :national, :additional_services,
        :dimension_object, :processing_status

      def initialize(options = {})
        @label_number         = options[:label_number]
        @postage_code_service = options[:postage_code_service]
        @cubage               = options[:cubage]
        @weight               = options[:weight]
        @receiver             = options[:receiver]
        @national             = options[:national]
        @additional_services  = options[:additional_services]
        @dimension_object     = options[:dimension_object]
        @processing_status    = options[:processing_status]
      end
    end
  end
end
