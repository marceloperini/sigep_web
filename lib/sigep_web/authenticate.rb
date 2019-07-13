# frozen_string_literal: true

module SigepWeb
  class Authenticate
    attr_reader :user, :password, :administrative_code,
                :contract, :card

    def initialize(user:, password:, administrative_code:, contract:, card:)
      @user = user
      @password = password
      @administrative_code = administrative_code
      @contract = contract
      @card = card
    end
  end
end

