require "spec_helper"

RSpec.describe SigepWeb::PostageCardStatus do
  subject(:postage_card_status) { described_class.new(postage_number_card: postage_number_card) }

  before do
    SigepWeb.configure do |config|
      config.user = "sigep"
      config.password = "n5f9t8"
      config.administrative_code = "17000190"
      config.contract = "9992157880"
      config.card = "0067599079"
    end
  end

  describe "#request" do
    context "when the request are successful", vcr: {cassette_name: "postage_card_status/success"} do
      let(:postage_number_card) { "0067599079" }

      it { expect(postage_card_status.request[:success]).to be_truthy }

      it "is expected to responds with correct status" do
        expect(postage_card_status.request[:response]).to eq("Normal")
      end
    end

    context "when request fail", vcr: {cassette_name: "postage_card_status/fail"} do
      let(:postage_number_card) { "000000" }

      it { expect(postage_card_status.request[:success]).to be_falsey }
    end
  end
end
