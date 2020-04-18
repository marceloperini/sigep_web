require 'spec_helper'

RSpec.describe SigepWeb::ZipQuery do
  subject(:zip_query) { described_class.new(options) }

  describe '#request' do
    context 'when request are successful', vcr: { cassette_name: 'zip_query/success' } do
      let(:options) { { zip: '70002900' } }

      it { expect(zip_query.request[:success]).to be_truthy }

      it 'is expected to responds with correct response' do
        expect(zip_query.request[:response]).to include_json(
          bairro: 'Asa Norte',
          cep: '70002900',
          cidade: 'Brasília',
          complemento2: nil,
          end: 'SBN Quadra 1 Bloco A',
          uf: 'DF'
        )
      end
    end

    context 'when request are faild', vcr: { cassette_name: 'zip_query/fail' } do
      let(:options) { { zip: '' } }

      it { expect(zip_query.request[:success]).to be_falsey }
    end
  end
end

