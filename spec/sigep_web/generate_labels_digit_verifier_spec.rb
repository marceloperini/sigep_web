require "spec_helper"

RSpec.describe SigepWeb::GenerateLabelsDigitVerifier do
  subject(:generate_labels_digit_verifier) { described_class.new(labels: labels) }

  before do
    SigepWeb.configure do |config|
      config.user = "sigep"
      config.password = "n5f9t8"
      config.administrative_code = "17000190"
      config.contract = "9992157880"
      config.card = "0067599079"
    end

    @dvs = SigepWeb.generate_labels_digit_verifier(
      labels: ["DL74668653 BR", "DL76023727 BR"]
    )
  end

  describe "#request" do
    context "when request are successful", vcr: {cassette_name: "generate_labels_digit_verifier/success"} do
      let(:labels) { ["DL74668653 BR", "DL76023727 BR"] }

      it { expect(generate_labels_digit_verifier.request[:success]).to be_truthy }

      it "is expected to responds with correct response" do
        expect(generate_labels_digit_verifier.request[:response]).to match_array(
          ["6", "2"]
        )
      end
    end

    context "when request failed", vcr: {cassette_name: "generate_labels_digit_verifier/fail"} do
      let(:labels) { ["no_label"] }

      it { expect(generate_labels_digit_verifier.request[:response]).to be_falsey }
    end
  end
end
