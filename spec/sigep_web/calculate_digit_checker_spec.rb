require 'spec_helper'

RSpec.describe SigepWeb::CalculateDigitChecker do
  subject(:calculate_digit_checker) { described_class.new(number: number) }

  before do
    SigepWeb.configure do |config|
      config.user                = 'sigep'
      config.password            = 'n5f9t8'
      config.administrative_code = '17000190'
      config.contract            = '9992157880'
      config.card                = '0067599079'
    end
  end

  describe '#request' do
    context 'when request are successful', vcr: { cassette_name: 'calculate_digit_checker/success' } do
      let(:number) { '15733879' }

      it { expect(calculate_digit_checker.request[:success]).to be_truthy }

      it 'is expected to responds with correct response' do
        expect(calculate_digit_checker.request[:response]).to include_json(
          data: '26/04/2020',
          hora: '00:10',
          cod_erro: '0',
          digito: '6',
          numero: '157338796'
        )
      end
    end

    context 'when request are failed', vcr: { cassette_name: 'calculate_digit_checker/fail' } do
      let(:number) { '' }

      it { expect(calculate_digit_checker.request[:success]).to be_falsey }
    end
  end
end

