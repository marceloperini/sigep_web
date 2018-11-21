require 'spec_helper'

describe SigepWeb::ServiceAvailability do
  let(:client) { double('client') }

  before do
    SigepWeb.configure do |config|
      config.user                = 'sigep'
      config.password            = 'n5f9t8'
      config.administrative_code = '17000190'
      config.contract            = '9912208555'
      config.card                = '0057018901'
    end

    @service = SigepWeb.service_availability(service_number: '04162',
                                             source_zip: '05311900',
                                             target_zip: '05311900')
  end

  it do
    client = double('client')

    expect(client).to receive(:client).with()
  end

  subject { @service }

  it 'should response success true' do
    expect(@service[:success]).to eq true
  end

  it 'should respond with 0#' do
    expect(@service[:response]).to eq '0#'
  end
end
