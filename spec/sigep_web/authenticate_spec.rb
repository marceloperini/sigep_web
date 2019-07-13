require 'spec_helper'

RSpec.describe SigepWeb::Authenticate do
  subject(:authenticate) { described_class.new build(:authenticate) }

  describe 'attributes' do
    it { is_expected.to respond_to(:user) }
    it { is_expected.to respond_to(:password) }
    it { is_expected.to respond_to(:administrative_code) }
    it { is_expected.to respond_to(:contract) }
    it { is_expected.to respond_to(:card) }
  end
end

