require 'spec_helper'

describe SigepWeb do
  before do
    SigepWeb.configure do |config|
      config.user = 'sigep'
      config.password = 'n5f9t8'
      config.administrative_code = '08082650'
      config.contract = '9912208555'
      config.card = '0057018901'
    end
  end

  subject { SigepWeb }

  it 'has the correct user' do
    expect(SigepWeb.configuration.user).to eq 'sigep'
  end

  it 'has the correct password' do
    expect(SigepWeb.configuration.password).to eq 'n5f9t8'
  end

  it 'has the correct administrative_code' do
    expect(SigepWeb.configuration.administrative_code).to eq '08082650'
  end

  it 'has the correct contract' do
    expect(SigepWeb.configuration.contract).to eq '9912208555'
  end

  it 'has the correct card' do
    expect(SigepWeb.configuration.card).to eq '0057018901'
  end

  it 'has a version number' do
    expect(SigepWeb::VERSION).not_to be nil
  end
end
