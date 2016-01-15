module SigepWeb
  module Models
    class DimensionObject
      attr_accessor :object_type, :height, :width, :length, :diameter

      def initialize(options = {})
        @object_type = options[:object_type]
        @height      = options[:height]
        @width       = options[:width]
        @length      = options[:length]
        @diameter    = options[:diameter]
      end
    end
  end
end
