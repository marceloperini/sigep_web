require 'spec_helper'

describe SigepWeb::ZipQuery do
  before do
    zip_query = SigepWeb.zip_query(zip: '70002900')
    @zq_return = zip_query.request
  end

  subject { @zq_return }

  it 'should response success true' do
    expect(@zq_return[:success]).to eq true
  end

  it 'should ApiResponse have correct neighborhood' do
    expect(@zq_return[:response].neighborhood).to eq 'Asa Norte'
  end

  it 'should ApiResponse have correct zip' do
    expect(@zq_return[:response].zip).to eq '70002900'
  end

  it 'should ApiResponse have correct city' do
    expect(@zq_return[:response].city).to eq 'Brasília'
  end

  it 'should ApiResponse have correct complement' do
    expect(@zq_return[:response].complement).to eq nil
  end

  it 'should ApiResponse have correct other_complement' do
    expect(@zq_return[:response].other_complement).to eq nil
  end

  it 'should ApiResponse have correct address' do
    expect(@zq_return[:response].address).to eq 'SBN Quadra 1 Bloco A'
  end

  it 'should ApiResponse have correct id' do
    expect(@zq_return[:response].id).to eq '0'
  end

  it 'should ApiResponse have correct uf' do
    expect(@zq_return[:response].uf).to eq 'DF'
  end
end
