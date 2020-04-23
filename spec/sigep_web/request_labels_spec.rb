require 'spec_helper'

RSpec.describe SigepWeb::RequestLabels do
  subject(:request_labels) do
    described_class.new(
      receiver_type: receiver_type, identifier: identifier,
      id_service: id_service, qt_labels: qt_labels
    )
  end

  before do
    SigepWeb.configure do |config|
      config.user                = 'sigep'
      config.password            = 'n5f9t8'
      config.administrative_code = '17000190'
      config.contract            = '9992157880'
      config.card                = '0067599079'
    end
  end

  describe '#request' do
    let(:receiver_type) { 'C' }
    let(:id_service) { '104707' }
    let(:qt_labels) { '1' }

    context 'when the request are successful', vcr: { cassette_name: 'request_labels/success' } do
      let(:identifier) { '34028316000103' }

      it { expect(request_labels.request[:success]).to be_truthy }

      it 'is expected to respond with correct response' do
        expect(request_labels.request[:response]).to match_array(
          ['SX08689123 BR']
        )
      end
    end

    context 'when the request are failed', vcr: { cassette_name: 'request_labels/fail' } do
      let(:identifier) { '000000000000' }

      it { expect(request_labels.request[:success]).to be_falsey }
    end
  end
end

