module SigepWeb
  class ZipQuery < WebServiceInterfaceApi
    def initialize(options = {})
      @zip = options[:zip]
      super()
    end

    def request
      begin
        response = process(:consulta_cep, {
          cep: @zip
        }).to_hash[:consulta_cep_response][:return]

        {
          success: true,
          response: ApiResponse.new(response)
        }
      rescue Savon::SOAPFault => msg
        {
          success: false,
          error: msg
        }
      end
    end
  end

  class ApiResponse
    attr_reader :neighborhood, :zip, :city, :complement, :other_complement,
      :address, :id, :uf

    def initialize(options = {})
      @neighborhood     = options[:bairro]
      @zip              = options[:cep]
      @city             = options[:cidade]
      @complement       = options[:complemento]
      @other_complement = options[:complemento2]
      @address          = options[:end]
      @id               = options[:id]
      @uf               = options[:uf]
    end
  end
end
