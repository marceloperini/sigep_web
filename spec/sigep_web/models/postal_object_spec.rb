require 'spec_helper'

RSpec.describe SigepWeb::Models::PostalObject do
  subject(:postal_object) do
    described_class.new(
      label_number: 'SX08689124BR', postage_code_service: '41068',
      cubage: '0,0000', weight: '200', receiver: receiver,
      dimension_object: dimension_object, processing_status: '0',
      additional_services_declared_value: '99,00'
    )
  end

  let(:dimension_object) do
    SigepWeb::Models::DimensionObject.new(
      object_type: '002', height: '20', width: '30', length: '38', diameter: '0'
    )
  end

  let(:receiver) do
    SigepWeb::Models::Receiver.new(
      name: 'Destino Ltda', phone: '6212349644', address: 'Avenida Central',
      complement: 'Qd: 102 A Lt: 04', number: '1065',
      neighborhood: 'Setor Industrial', city: 'Goiânia',
      uf: 'GO', cep: '74000100', description_object: '', amount: '0,0',
      invoice_number: '102030'
    )
  end

  it { is_expected.to respond_to :label_number }
  it { is_expected.to respond_to :postage_code_service }
  it { is_expected.to respond_to :cubage }
  it { is_expected.to respond_to :weight }
  it { is_expected.to respond_to :receiver }
  it { is_expected.to respond_to :dimension_object }
  it { is_expected.to respond_to :processing_status }
  it { is_expected.to respond_to :additional_service_codes }
  it { is_expected.to respond_to :additional_services_declared_value }
end

