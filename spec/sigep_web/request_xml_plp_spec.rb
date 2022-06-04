require "spec_helper"

RSpec.describe SigepWeb::RequestXmlPlp do
  subject(:request_xml_plp) { described_class.new(id_plp: id_plp) }

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
    context "when the request are successful", vcr: {cassette_name: "request_xml_plp/success"} do
      let(:id_plp) { "11234567" }

      xit { expect(request_xml_plp.request[:success]).to be(true) }
    end

    context "when the request are fail", vcr: {cassette_name: "request_xml_plp/fail"} do
      let(:id_plp) { "000" }

      it { expect(request_xml_plp.request[:success]).to be(false) }
    end
  end
end
