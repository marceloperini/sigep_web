module SigepWeb
  module Models
    class Receiver
      attr_accessor :name, :phone, :cellphone, :email, :address,
        :complement, :number

      def initialize(options = {})
        @name       = options[:name]
        @phone      = options[:phone]
        @cellphone  = options[:cellphone]
        @email      = options[:email]
        @address    = options[:address]
        @complement = options[:complement]
        @number     = options[:number]
      end
    end
  end
end
