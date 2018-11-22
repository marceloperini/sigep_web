require 'spec_helper'

require 'pry'

describe SigepWeb::ServiceAvailability do
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
    allow(client).to receive(:call).and_return({
      verifica_disponibilidade_servico_response: {
        return: '0#',
        :"@xmlns:ns2" => 'http://cliente.bean.master.sigep.bsb.correios.com.br/'
      }
    })
  end

  subject(:service_availability) do
    SigepWeb::ServiceAvailability.new(service_number: '04162',
                                      source_zip: '05311900',
                                      target_zip: '05311900',
                                      transfer: transfer)
  end

  it 'should response success true' do
    expect(service_availability.request[:success]).to eq true
  end

  it 'should respond with 0#' do
    expect(service_availability.request[:response]).to eq '0#'
  end
end
