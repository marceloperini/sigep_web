# frozen_string_literal: true

module SigepWeb
  module Models
    class DimensionObject
      attr_accessor :object_type, :height, :width, :length, :diameter

      def initialize(object_type:, height:, width:, length:, diameter:)
        @object_type = object_type
        @height      = height
        @width       = width
        @length      = length
        @diameter    = diameter
      end
    end
  end
end

