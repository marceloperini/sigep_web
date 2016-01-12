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

    @service_availability = SigepWeb::ServiceAvailability.new(service_number: '40096',
                                                             source_zip: '70002900',
                                                             target_zip: '81350120')
  end

  subject { @service_availability }

  it 'should respond with true' do
    expect(@service_availability.request).to eq true
  end
end
