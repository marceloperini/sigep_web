require 'spec_helper'

RSpec.describe SigepWeb do
  subject(:sigep_web) { described_class }

  before do
    SigepWeb.configure do |config|
      config.user                = 'sigep'
      config.password            = 'n5f9t8'
      config.administrative_code = '08082650'
      config.contract            = '9912208555'
      config.card                = '0057018901'
    end
  end

  describe '.configuration' do
    it 'should have the correct user' do
      expect(SigepWeb.configuration.user).to eq 'sigep'
    end

    it 'should have the correct password' do
      expect(SigepWeb.configuration.password).to eq 'n5f9t8'
    end

    it 'should have the correct administrative_code' do
      expect(SigepWeb.configuration.administrative_code).to eq '08082650'
    end

    it 'should have the correct contract' do
      expect(SigepWeb.configuration.contract).to eq '9912208555'
    end

    it 'should have the correct card' do
      expect(SigepWeb.configuration.card).to eq '0057018901'
    end
  end

  describe '.service_availability' do
    let(:service_availability) { instance_double(SigepWeb::ServiceAvailability) }

    before do
      allow(SigepWeb::ServiceAvailability).to receive(:new).and_return(service_availability)
      allow(service_availability).to receive(:request)

      sigep_web.service_availability(
        service_number: '0', source_zip: '0', target_zip: '0'
      )
    end

    it 'is expected to access SigepWeb::ServiceAvailability#request' do
      expect(service_availability).to have_received(:request)
    end
  end

  describe '.search_client' do
    let(:search_client) { instance_double(SigepWeb::SearchClient) }

    before do
      allow(SigepWeb::SearchClient).to receive(:new).and_return(search_client)
      allow(search_client).to receive(:request)

      sigep_web.search_client
    end

    it 'is expeceted to access SigepWeb::SearchClient#request' do
      expect(search_client).to have_received(:request)
    end
  end

  describe '.zip_query' do
    let(:zip_query) { instance_double(SigepWeb::ZipQuery) }

    before do
      allow(SigepWeb::ZipQuery).to receive(:new).and_return(zip_query)
      allow(zip_query).to receive(:request)

      sigep_web.zip_query
    end

    it 'is expeceted to access SigepWeb::ZipQuery' do
      expect(zip_query).to have_received(:request)
    end
  end

  describe '.request_labels' do
    let(:request_labels) { instance_double(SigepWeb::RequestLabels) }

    before do
      allow(SigepWeb::RequestLabels).to receive(:new).and_return(request_labels)
      allow(request_labels).to receive(:request)

      sigep_web.request_labels
    end

    it 'is expeceted to access SigepWeb::RequestLabels' do
      expect(request_labels).to have_received(:request)
    end
  end

  describe '.generate_labels_digit_verifier' do
    let(:generate_labels_digit_verifier) { instance_double(SigepWeb::GenerateLabelsDigitVerifier) }

    before do
      allow(SigepWeb::GenerateLabelsDigitVerifier)
        .to receive(:new).and_return(generate_labels_digit_verifier)
      allow(generate_labels_digit_verifier).to receive(:request)

      sigep_web.generate_labels_digit_verifier
    end

    it 'is expeceted to access SigepWeb::GenerateLabelsDigitVerifier' do
      expect(generate_labels_digit_verifier).to have_received(:request)
    end
  end

  describe '.request_ptp_services' do
    let(:request_ptp_services) { instance_double(SigepWeb::RequestPlpServices) }

    before do
      allow(SigepWeb::RequestPlpServices)
        .to receive(:new).and_return(request_ptp_services)
      allow(request_ptp_services).to receive(:request)

      sigep_web.request_plp_services
    end

    it 'is expeceted to access SigepWeb::RequestPlpServices' do
      expect(request_ptp_services).to have_received(:request)
    end
  end

  describe '.postage_card_status' do
    let(:postage_card_status) { instance_double(SigepWeb::PostageCardStatus) }

    before do
      allow(SigepWeb::PostageCardStatus)
        .to receive(:new).and_return(postage_card_status)
      allow(postage_card_status).to receive(:request)

      sigep_web.postage_card_status
    end

    it 'is expeceted to access SigepWeb::PostageCardStatus' do
      expect(postage_card_status).to have_received(:request)
    end
  end
end
