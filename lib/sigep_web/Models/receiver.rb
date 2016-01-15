module SigepWeb
  module Models
    class Receiver
      attr_accessor :name, :phone, :cellphone, :email, :address,
        :complement, :neighborhood, :city, :uf, :cep, :number,
        :user_postal_code, :cost_center_client, :invoice_number,
        :invoice_serie, :invoice_value, :invoice_nature,
        :description_object, :amount

      def initialize(options = {})
        @name               = options[:name]
        @phone              = options[:phone]
        @cellphone          = options[:cellphone]
        @email              = options[:email]
        @address            = options[:address]
        @complement         = options[:complement]
        @number             = options[:number]
        @neighborhood       = options[:neighborhood]
        @city               = options[:city]
        @uf                 = options[:uf]
        @cep                = options[:cep]
        @user_postal_code   = options[:user_postal_code]
        @cost_center_client = options[:cost_center_client]
        @invoice_number     = options[:invoice_number]
        @invoice_serie      = options[:invoice_serie]
        @invoice_value      = options[:invoice_value]
        @invoice_nature     = options[:invoice_nature]
        @description_object = options[:description_object]
        @amount             = options[:amount]
      end
    end
  end
end
