require 'spec_helper'

RSpec.describe SigepWeb do
  subject(:sigep_web) { described_class }

  describe '.configuration' do
    it 'returns an SigepWeb::Configuration instance' do
      expect(SigepWeb.configuration.class).to eq(SigepWeb::Configuration)
    end
  end

  describe '.service_availability' do
    let(:service_availability) { instance_double(SigepWeb::ServiceAvailability) }

    before do
      allow(SigepWeb::ServiceAvailability).to receive(:new).and_return(service_availability)
      allow(service_availability).to receive(:request)

      sigep_web.service_availability
    end

    it 'call ServiceAvailability#request method' do
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

    it 'call SearchClient#request method' do
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

    it 'call ZipQuery#request method' do
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

    it 'call RequestLabels#request method' do
      expect(request_labels).to have_received(:request)
    end
  end

  describe '.generate_labels_digit_verifier' do
    let(:generate_labels_digit_verifier) { instance_double(SigepWeb::GenerateLabelsDigitVerifier) }

    before do
      allow(SigepWeb::GenerateLabelsDigitVerifier).to receive(:new).and_return(generate_labels_digit_verifier)
      allow(generate_labels_digit_verifier).to receive(:request)

      sigep_web.generate_labels_digit_verifier
    end

    it 'call GenerateLabelsDigitVerifier#request method' do
      expect(generate_labels_digit_verifier).to have_received(:request)
    end
  end

  describe '.request_plp_services' do
    let(:request_plp_services) { instance_double(SigepWeb::RequestPlpServices) }

    before do
      allow(SigepWeb::RequestPlpServices).to receive(:new).and_return(request_plp_services)
      allow(request_plp_services).to receive(:request)

      sigep_web.request_plp_services
    end

    it 'call RequestPlpServices#request method' do
      expect(request_plp_services).to have_received(:request)
    end
  end

  describe '.postage_card_status' do
    let(:postage_card_status) { instance_double(SigepWeb::PostageCardStatus) }

    before do
      allow(SigepWeb::PostageCardStatus).to receive(:new).and_return(postage_card_status)
      allow(postage_card_status).to receive(:request)

      sigep_web.postage_card_status
    end

    it 'call PostageCardStatus#request method' do
      expect(postage_card_status).to have_received(:request)
    end
  end

  describe '.request_xml_plp' do
    let(:request_xml_plp) { instance_double(SigepWeb::RequestXmlPlp) }

    before do
      allow(SigepWeb::RequestXmlPlp).to receive(:new).and_return(request_xml_plp)
      allow(request_xml_plp).to receive(:request)

      sigep_web.request_xml_plp
    end

    it 'call RequestXmlPlp#request method' do
      expect(request_xml_plp).to have_received(:request)
    end
  end

  describe '.request_range' do
    let(:request_range) { instance_double(SigepWeb::RequestRange) }

    before do
      allow(SigepWeb::RequestRange).to receive(:new).and_return(request_range)
      allow(request_range).to receive(:request)

      sigep_web.request_range
    end

    it 'call RequestRange#request method' do
      expect(request_range).to have_received(:request)
    end
  end

  describe '.calculate_digit_checker' do
    let(:calculate_digit_checker) { instance_double(SigepWeb::CalculateDigitChecker) }

    before do
      allow(SigepWeb::CalculateDigitChecker).to receive(:new).and_return(calculate_digit_checker)
      allow(calculate_digit_checker).to receive(:request)

      sigep_web.calculate_digit_checker
    end

    it 'call RequestRange#request method' do
      expect(calculate_digit_checker).to have_received(:request)
    end
  end
end

