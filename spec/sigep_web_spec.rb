require 'spec_helper'

RSpec.describe SigepWeb do
  subject(:sigep_web) { described_class }

  before do
    SigepWeb.configure do |config|
      config.user                = 'sigep'
      config.password            = 'n5f9t8'
      config.administrative_code = '08082650'
      config.contract            = '9912208555'
      config.card                = '0057018901'
    end
  end

  describe '.configuration' do
    it 'should have the correct user' do
      expect(SigepWeb.configuration.user).to eq 'sigep'
    end

    it 'should have the correct password' do
      expect(SigepWeb.configuration.password).to eq 'n5f9t8'
    end

    it 'should have the correct administrative_code' do
      expect(SigepWeb.configuration.administrative_code).to eq '08082650'
    end

    it 'should have the correct contract' do
      expect(SigepWeb.configuration.contract).to eq '9912208555'
    end

    it 'should have the correct card' do
      expect(SigepWeb.configuration.card).to eq '0057018901'
    end
  end

  describe '.service_availability' do
    let(:service_availability) { instance_double(ServiceAvailability) }

    before do
      allow(ServiceAvailability).to receive(:new).and_return(service_availability)
      allow(service_availability).to receive(:request)

      sigep_web.service_availability
    end

    it 'is expected to access ServiceAvailability#request' do
      expect(service_availability).to have_received(:request)
    end
  end
end
