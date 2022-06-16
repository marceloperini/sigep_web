require "spec_helper"

RSpec.describe SigepWeb::RequestPlpServices do
  subject(:request_plp_services) do
    described_class.new(plp: plp, id_plp_client: id_plp_client, labels: labels)
  end

  let(:receiver) do
    SigepWeb::Models::Receiver.new(
      name: "Destino Ltda", phone: "6212349644", address: "Avenida Central",
      complement: "Qd: 102 A Lt: 04", number: "1065",
      neighborhood: "Setor Industrial", city: "Goiânia",
      uf: "GO", cep: "74000100", description_object: "", amount: "0,0",
      invoice_number: "102030"
    )
  end

  let(:dimension_object) do
    SigepWeb::Models::DimensionObject.new(
      object_type: "002", height: "20", width: "30", length: "38", diameter: "0"
    )
  end

  let(:postal_object) do
    SigepWeb::Models::PostalObject.new(
      label_number: "SX08689124BR", postage_code_service: "41068",
      cubage: "0,0000", weight: "200", receiver: receiver,
      dimension_object: dimension_object, processing_status: "0",
      additional_services_declared_value: "99,00"
    )
  end

  let(:plp) do
    SigepWeb::Models::Sender.new(
      directorship_number: "36", name: "Empresa Ltda",
      address: "Avenida Central", number: "2370",
      complement: "sala 1205,12° andar", neighborhood: "Centro",
      zip_code: "70002900", city: "Brasília", uf: "PR", phone: "6112345008",
      email: "cli@mail.com.br", postal_objects: [postal_object]
    )
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
    context "when the request are successful", vcr: {cassette_name: "request_plp_services/success"} do
      let(:labels) { ["SX08689124BR"] }
      let(:id_plp_client) { 123 }

      it { expect(request_plp_services.request[:success]).to be_truthy }

      it "is expected to responds with correct response" do
        expect(request_plp_services.request[:response]).to eq("48733691")
      end
    end

    context "when the request are failed", vcr: {cassette_name: "request_plp_services/fail"} do
      let(:labels) { [""] }
      let(:id_plp_client) { 123 }

      it { expect(request_plp_services.request[:success]).to be_falsey }
    end
  end
end
