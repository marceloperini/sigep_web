require 'spec_helper'

describe SigepWeb::ZipQuery do
  before do
    @zip = SigepWeb.zip_query(zip: '70002900')
  end

  subject { @zip }

  it 'should response success true' do
    expect(@zip[:success]).to eq true
  end

  it 'should ApiResponse have correct neighborhood' do
    expect(@zip[:response][:bairro]).to eq 'Asa Norte'
  end

  it 'should ApiResponse have correct zip' do
    expect(@zip[:response][:cep]).to eq '70002900'
  end

  it 'should ApiResponse have correct city' do
    expect(@zip[:response][:cidade]).to eq 'Brasília'
  end

  it 'should ApiResponse have correct complement' do
    expect(@zip[:response][:complemento]).to eq nil
  end

  it 'should ApiResponse have correct other_complement' do
    expect(@zip[:response][:complemento2]).to eq nil
  end

  it 'should ApiResponse have correct address' do
    expect(@zip[:response][:end]).to eq 'SBN Quadra 1 Bloco A'
  end

  it 'should ApiResponse have correct id' do
    expect(@zip[:response][:id]).to eq nil
  end

  it 'should ApiResponse have correct uf' do
    expect(@zip[:response][:uf]).to eq 'DF'
  end
end
