module SigepWeb
  class ZipQuery < WebServiceInterfaceApi
    def initialize(options = {})
      @zip = options[:zip]
      super()
    end

    def request
      process(:consulta_cep, {
        cep: @zip
      }).to_hash[:consulta_cep_response][:return]
    end
  end
end
