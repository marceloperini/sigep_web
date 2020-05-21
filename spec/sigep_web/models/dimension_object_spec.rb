require 'spec_helper'

RSpec.describe SigepWeb::Models::DimensionObject do
  subject(:dimension_object) do
    described_class.new(
      object_type: '002',
      height: '20',
      width: '30',
      length: '38',
      diameter: '0'
    )
  end

  it { expect(dimension_object.object_type).to eq('002') }
  it { expect(dimension_object.height).to eq('20') }
  it { expect(dimension_object.width).to eq('30') }
  it { expect(dimension_object.length).to eq('38') }
  it { expect(dimension_object.diameter).to eq('0') }
end

