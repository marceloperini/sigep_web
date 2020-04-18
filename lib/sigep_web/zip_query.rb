# frozen_string_literal: true

module SigepWeb
  class ZipQuery < WebServiceInterfaceApi
    def initialize(zip:)
      @zip = zip

      super()
    end

    def request
      response = process(
        :consulta_cep, cep: zip
      ).to_hash[:consulta_cep_response][:return]

      { success: true, response: response }
    rescue Savon::SOAPFault => msg
      { success: false, error: msg }
    end

    private

    attr_reader :zip
  end
end
