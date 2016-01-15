require 'spec_helper'

describe SigepWeb::ServiceAvailability do
  before do
    SigepWeb.configure do |config|
      config.user                = 'sigep'
      config.password            = 'n5f9t8'
      config.administrative_code = '08082650'
      config.contract            = '9912208555'
      config.card                = '0057018901'
    end

    service_availability = SigepWeb.service_availability(service_number: '40096',
                                                          source_zip: '70002900',
                                                          target_zip: '81350120')
    @sa_return = service_availability.request
  end

  subject { @sa_return }

  it 'should response success true' do
    expect(@sa_return[:success]).to eq true
  end

  it 'should respond with true' do
    expect(@sa_return[:response]).to eq true
  end
end
