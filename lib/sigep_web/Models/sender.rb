module SigepWeb
  module Models
    class Sender
      def initialize(options = {})
        authenticate = SigepWeb.configuration.authenticate

        @card = authenticate.card
        @contract_number = authenticate.contract
        @directorship_number = options[:directorship_number]
        @administrative_code = authenticate.administrative_code
        @name = options[:name]
        @address = options[:address]
        @number = options[:number]
        @complement = options[:complement]
        @neighborhood = options[:neighborhood]
        @zip_code = options[:zip_code]
        @city = options[:city]
        @uf = options[:uf]
        @phone = options[:phone]
        @fax = options[:fax]
        @email = options[:email]
        @payment_form = options[:payment_form]
        @postal_objects = options[:postal_objects]
      end

      def to_xml
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.correioslog do
            xml.tipo_postagem 'Postagem'
            xml.versao_arquivo '2.3'
            xml.plp do
              xml.plp.cartao_postagem @card
            end

            xml.remetente do
              xml.numero_contrato @contract_number
              xml.numero_diretoria @directorship_number
              xml.codigo_administrativo @administrative_code
              xml.nome_remetente @name
              xml.logradouro_remetente @address
              xml.numero_remetente @number
              xml.complemento_remetente @complement
              xml.bairro_remetente @neighborhood
              xml.cep_remetente @zip_code
              xml.cidate_remetente @city
              xml.uf_remetente @uf
              xml.telefone_remetente @phone
              xml.fax_remetente @fax
              xml.email_remetente @email
            end

            xml.forma_pagamento @payment_form

            XML::PostalObject.new(xml, @postal_objects).build_xml
          end
        end

        builder.to_xml
      end
    end
  end
end
