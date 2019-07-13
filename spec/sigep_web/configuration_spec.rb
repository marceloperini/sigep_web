require 'spec_helper'

RSpec.describe SigepWeb::Configuration do
  let(:configuration) { build(:configuration) }

  describe 'attributes' do
    it { is_expected.to respond_to(:user) }
    it { is_expected.to respond_to(:password) }
    it { is_expected.to respond_to(:administrative_code) }
    it { is_expected.to respond_to(:contract) }
    it { is_expected.to respond_to(:card) }
  end

  describe '#authenticate' do
    subject(:authenticate) { configuration.authenticate }

    it 'returns an SigepWeb::Authenticate instance' do
      expect(authenticate.class).to eq(SigepWeb::Authenticate)
    end

    it 'instanciate SigepWeb::Authenticate with same user' do
      expect(authenticate.user).to eq(configuration.user)
    end

    it 'instanciate SigepWeb::Authenticate with same password' do
      expect(authenticate.password).to eq(configuration.password)
    end

    it 'instanciate SigepWeb::Authenticate with same administrative_code' do
      expect(authenticate.administrative_code).to eq(configuration.administrative_code)
    end

    it 'instanciate SigepWeb::Authenticate with same contract' do
      expect(authenticate.contract).to eq(configuration.contract)
    end

    it 'instanciate SigepWeb::Authenticate with same card' do
      expect(authenticate.card).to eq(configuration.card)
    end
  end
end

