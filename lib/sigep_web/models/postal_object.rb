# frozen_string_literal: true

module SigepWeb
  module Models
    class PostalObject
      attr_accessor :label_number, :postage_code_service, :cubage,
        :weight, :receiver, :dimension_object, :processing_status,
        :additional_service_codes, :additional_services_declared_value

      def initialize(label_number:, postage_code_service:, cubage:, weight:,
        receiver:, dimension_object:, processing_status:,
        additional_service_codes: nil, additional_services_declared_value: nil)

        @label_number = label_number
        @postage_code_service = postage_code_service
        @cubage = cubage
        @weight = weight
        @receiver = receiver
        @dimension_object = dimension_object
        @processing_status = processing_status
        @additional_service_codes = additional_service_codes
        @additional_services_declared_value = additional_services_declared_value
      end
    end
  end
end
