require 'spec_helper'

RSpec.describe SigepWeb::Models::AdditionalService do
  subject(:additional_service) do
    described_class.new(codes: '025', declareted_value: 100.00)
  end

  it { expect(additional_service.codes).to eq('025') }

  it { expect(additional_service.declareted_value).to eq(100.00) }
end

