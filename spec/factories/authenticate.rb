FactoryBot.define do
  factory :authenticate, class: Hash do
    user { 'sigep' }
    password { 'n5f9t8' }
    administrative_code { '08082650' }
    contract { '9912208555' }
    card { '0057018901' }

    initialize_with { attributes }
  end
end

