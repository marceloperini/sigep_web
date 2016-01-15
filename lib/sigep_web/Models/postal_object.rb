module SigepWeb
  module Models
    class PostalObject
      attr_accessor :label_number, :postage_code_service, :cubage,
        :weight, :receiver, :dimension_object, :processing_status,
        :additional_service_codes, :additional_services_declared_value

      def initialize(options = {})
        @label_number                      = options[:label_number]
        @postage_code_service              = options[:postage_code_service]
        @cubage                            = options[:cubage]
        @weight                            = options[:weight]
        @receiver                          = options[:receiver]
        @dimension_object                  = options[:dimension_object]
        @processing_status                 = options[:processing_status]
        @additional_service_codes          = options[:additional_service_codes]
        @additional_services_declared_value = options[:additional_services_declared_value]
      end
    end
  end
end
