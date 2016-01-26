require 'spec_helper'

describe SigepWeb::RequestLabels do
  before do
    SigepWeb.configure do |config|
      config.user                = 'sigep'
      config.password            = 'n5f9t8'
      config.administrative_code = '08082650'
      config.contract            = '9912208555'
      config.card                = '0057018901'
    end

    @labels = SigepWeb.request_labels(receiver_type: 'C',
                                      identifier: '00000000000000',
                                      id_service: '104625',
                                      qt_labels: '1')
  end

  subject { @request_labels }
end
