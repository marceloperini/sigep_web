require "spec_helper"

RSpec.describe SigepWeb::SearchClient do
  subject(:search_client) {
    described_class.new(id_contract: id_contract, id_post_card: id_post_card)
  }

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
    context "when request are successful", vcr: {cassette_name: "search_client/success"} do
      let(:id_contract) { "9992157880" }
      let(:id_post_card) { "0067599079" }

      it { expect(search_client.request[:success]).to be_truthy }

      it "is expected to responds with correct response" do
        expect(search_client.request[:response]).to include_json(
          cnpj: "34028316000103      ",
          contratos: {}
        )
      end
    end

    context "when request failed", vcr: {cassette_name: "search_client/fail"} do
      let(:id_contract) { "" }
      let(:id_post_card) { "0067599079" }

      it { expect(search_client.request[:success]).to be_falsey }
    end
  end
end
