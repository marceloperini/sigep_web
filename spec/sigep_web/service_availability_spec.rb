require 'spec_helper'

RSpec.describe SigepWeb::ServiceAvailability do
  subject(:service_availability) do
    described_class.new(
      service_number: '04162',
      source_zip: '05311900',
      target_zip: '05311900',
      transfer: transfer
    )
  end

  let(:transfer) { double('transfer') }
  let(:client) { double('client') }

  before do
    SigepWeb.configure do |config|
      config.user                = 'sigep'
      config.password            = 'n5f9t8'
      config.administrative_code = '17000190'
      config.contract            = '9912208555'
      config.card                = '0057018901'
    end

    allow(transfer).to receive(:client).and_return(client)
  end

  describe '#request' do
    context 'when request are successful' do
      before do
        allow(client).to receive(:call).and_return({
          verifica_disponibilidade_servico_response: {
            return: '0#',
            :"@xmlns:ns2" => 'http://cliente.bean.master.sigep.bsb.correios.com.br/'
          }
        })
      end

      it { expect(service_availability.request[:success]).to be_truthy }

      it 'is expected to responds with 0#' do
        expect(service_availability.request[:response]).to eq '0#'
      end
    end

    context 'when request fail' do
      before do
        allow(client).to receive(:call).and_raise(
          Savon::SOAPFault.new('error', 'error')
        )
      end

      it { expect(service_availability.request[:success]).to be_falsey }
    end
  end
end

