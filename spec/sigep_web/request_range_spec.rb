require "spec_helper"

RSpec.describe SigepWeb::RequestRange do
  subject(:request_range) do
    described_class.new(type: type, service: service, quantity: quantity)
  end

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
    context "when the request are successful", vcr: {cassette_name: "request_range/successful"} do
      let(:user) { "sigep" }
      let(:type) { "AP" }
      let(:service) { "" }
      let(:quantity) { 1 }

      it { expect(request_range.request[:success]).to be_truthy }

      it "is expected to responds with correct response" do
        expect(request_range.request[:response]).to eq(
          data: "05/05/2020", hora: "21:30", cod_erro: "0",
          faixa_inicial: "104233398", faixa_final: "104233398"
        )
      end
    end

    context "when the request are fail", vcr: {cassette_name: "request_range/fail"} do
      let(:type) { nil }
      let(:service) { "" }
      let(:quantity) { 1 }

      it { expect(request_range.request[:success]).to be_falsey }

      it "is expected to responds with error message" do
        expect(request_range.request[:error]).to eq(
          "TIPO DA SOLICITAÇÃO INVÁLIDA"
        )
      end
    end
  end
end
