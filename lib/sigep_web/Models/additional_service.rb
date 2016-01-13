module SigepWeb
  module Models
    class AdditionalService
      attr_accessor :codes, :declareted_value

      def initialize(options = {})
        @codes            = options[:codes]
        @declareted_value = options[:declareted_value]
      end
    end
  end
end
