module SigepWeb
  module Models
    class National
      attr_accessor :neighborhood, :city, :uf, :cep, :user_postal_code,
        :cost_center_client, :invoice_number, :invoice_serie,
        :invoice_value, :invoice_nature, :description_object,
        :amount

      def initialize(options = {})
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
