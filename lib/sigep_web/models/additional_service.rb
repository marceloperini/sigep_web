# frozen_string_literal: true

module SigepWeb
  module Models
    class AdditionalService
      attr_accessor :codes, :declareted_value

      def initialize(codes:, declareted_value:)
        @codes = codes
        @declareted_value = declareted_value
      end
    end
  end
end
