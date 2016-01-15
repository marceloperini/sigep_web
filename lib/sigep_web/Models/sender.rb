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
        builder = Nokogiri::XML::Builder.new(encoding: 'ISO-8859-1') do |xml|
          xml.correioslog do
            xml.tipo_arquivo 'Postagem'
            xml.versao_arquivo '2.3'
            xml.plp do
              xml.id_plp
              xml.valor_global
              xml.mcu_unidade_postagem
              xml.nome_unidade_postagem
              xml.cartao_postagem @card
            end

            xml.remetente do
              xml.numero_contrato @contract_number
              xml.numero_diretoria @directorship_number
              xml.codigo_administrativo @administrative_code
              xml.nome_remetente { xml.cdata @name }
              xml.logradouro_remetente { xml.cdata @address }
              xml.numero_remetente @number
              xml.complemento_remetente { xml.cdata @complement }
              xml.bairro_remetente { xml.cdata @neighborhood }
              xml.cep_remetente { xml.cdata @zip_code }
              xml.cidade_remetente { xml.cdata @city }
              xml.uf_remetente @uf
              xml.telefone_remetente { xml.cdata @phone }
              xml.fax_remetente { xml.cdata @fax }
              xml.email_remetente { xml.cdata @email }
            end

            xml.forma_pagamento @payment_form

            XML::PostalObject.new(xml, @postal_objects).build_xml
          end
        end

        builder.to_xml.gsub(/\n/, '').encode(Encoding::UTF_8)
      end

      def example_xml
        builder = Nokogiri::XML::Builder.new(encoding: 'ISO-8859-1') do |xml|
          xml.correioslog do
            xml.tipo_arquivo 'Postagem'
            xml.versao_arquivo '2.3'
            xml.plp do
              xml.id_plp
              xml.valor_global
              xml.mcu_unidade_postagem
              xml.nome_unidade_postagem
              xml.cartao_postagem @card
            end

            xml.remetente do
              xml.numero_contrato @contract_number
              xml.numero_diretoria @directorship_number
              xml.codigo_administrativo @administrative_code
              xml.nome_remetente { xml.cdata @name }
              xml.logradouro_remetente { xml.cdata @address }
              xml.numero_remetente @number
              xml.complemento_remetente { xml.cdata @complement }
              xml.bairro_remetente { xml.cdata @neighborhood }
              xml.cep_remetente { xml.cdata @zip_code }
              xml.cidade_remetente { xml.cdata @city }
              xml.uf_remetente @uf
              xml.telefone_remetente { xml.cdata @phone }
              xml.fax_remetente { xml.cdata @fax }
              xml.email_remetente { xml.cdata @email }
            end

            xml.forma_pagamento @payment_form

            XML::PostalObject.new(xml, @postal_objects).build_xml
          end
        end

        builder.to_xml.encode(Encoding::UTF_8)
      end
    end
  end
end
