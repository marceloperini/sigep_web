require 'spec_helper'

RSpec.describe SigepWeb::ServiceAvailability do
  subject(:service_availability) { described_class.new(options) }

  before do
    SigepWeb.configure do |config|
      config.user                = 'sigep'
      config.password            = 'n5f9t8'
      config.administrative_code = '17000190'
      config.contract            = '9912208555'
      config.card                = '0057018901'
    end
  end

  describe '#request' do
    context 'when request are successful', vcr: { cassette_name: 'service_availability/success' } do
      let(:options) do
        {
          service_number: '04162',
          source_zip: '05311900',
          target_zip: '05311900'
        }
      end

      it { expect(service_availability.request[:success]).to be_truthy }

      it 'is expected to responds with 0#' do
        expect(service_availability.request[:response]).to eq '0#'
      end
    end

    context 'when request fail', vcr: { cassette_name: 'service_availability/fail' } do
      let(:options) do
        {
          service_number: '',
          source_zip: '05311900',
          target_zip: '05311900'
        }
      end
      it { expect(service_availability.request[:success]).to be_falsey }
    end
  end
end

