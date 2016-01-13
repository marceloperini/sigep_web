require 'spec_helper'

describe SigepWeb::ZipQuery do
  before do
    @zip_query = SigepWeb.zip_query(zip: '70002900')
  end

  subject { @zip_query }

  it 'should have the correct class' do
    expect(@zip_query.request.class).to eq SigepWeb::ApiResponse
  end

  it 'should ApiResponse have correct neighborhood' do
    expect(@zip_query.request.neighborhood).to eq 'Asa Norte'
  end

  it 'should ApiResponse have correct zip' do
    expect(@zip_query.request.zip).to eq '70002900'
  end

  it 'should ApiResponse have correct city' do
    expect(@zip_query.request.city).to eq 'Brasília'
  end

  it 'should ApiResponse have correct complement' do
    expect(@zip_query.request.complement).to eq nil
  end

  it 'should ApiResponse have correct other_complement' do
    expect(@zip_query.request.other_complement).to eq nil
  end

  it 'should ApiResponse have correct address' do
    expect(@zip_query.request.address).to eq 'SBN Quadra 1 Bloco A'
  end

  it 'should ApiResponse have correct id' do
    expect(@zip_query.request.id).to eq '0'
  end

  it 'should ApiResponse have correct uf' do
    expect(@zip_query.request.uf).to eq 'DF'
  end
end
