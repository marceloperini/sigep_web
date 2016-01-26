require 'spec_helper'

describe SigepWeb::GenerateLabelsDigitVerifier do
  before do
    SigepWeb.configure do |config|
      config.user                = 'sigep'
      config.password            = 'n5f9t8'
      config.administrative_code = '08082650'
      config.contract            = '9912208555'
      config.card                = '0057018901'
    end

    @dvs = SigepWeb.generate_labels_digit_verifier(labels: ['DL74668653 BR',
                                                             'DL76023727 BR'])
  end

  subject { @dvs }

  it 'should return success true' do
    expect(@dvs[:success]).to eq true
  end

  it 'should responde with correct array' do
    expect(@dvs[:response]).to eq ['6', '2']
  end
end
