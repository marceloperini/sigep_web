require 'spec_helper'

describe SigepWeb::RequestPlpServices do
  before do
    SigepWeb.configure do |config|
      config.user                = 'sigep'
      config.password            = 'n5f9t8'
      config.administrative_code = '08082650'
      config.contract            = '9912208555'
      config.card                = '0057018901'
    end

    receiver = SigepWeb::Models::Receiver.new(name: 'Destino Ltda', phone: '6212349644',
                                              address: 'Avenida Central',
                                              complement: 'Qd: 102 A Lt: 04',
                                              number: '1065',
                                              neighborhood: 'Setor Industrial',
                                              city: 'Goiânia',
                                              uf: 'GO', cep: '74000100',
                                              description_object: '',
                                              amount: '0,0',
                                              invoice_number: '102030')
    dimension_object = SigepWeb::Models::DimensionObject.new(object_type: '002',
                                                             height: '20',
                                                             width: '30',
                                                             length: '38',
                                                             diameter: '0')
    postal_object = SigepWeb::Models::PostalObject.new(label_number: 'PH185560916BR',
                                                       postage_code_service: '41068',
                                                       cubage: '0,0000',
                                                       weight: '200',
                                                       receiver: receiver,
                                                       dimension_object: dimension_object,
                                                       processing_status: '0',
                                                       additional_services_declared_value: '99,00')
    sender = SigepWeb::Models::Sender.new(directorship_number: '36', name: 'Empresa Ltda',
                                          address: 'Avenida Central', number: '2370',
                                          complement: 'sala 1205,12° andar',
                                          neighborhood: 'Centro', zip_code: '70002900',
                                          city: 'Brasília', uf: 'PR',
                                          phone: '6112345008', email: 'cli@mail.com.br',
                                          postal_objects: [postal_object])
    @plp = SigepWeb.request_plp_services(plp: sender, id_plp_client: 123,
                                         labels: ['PH18556091BR'])

  end

  subject { @plp }
end
