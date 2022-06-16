module SigepWeb
  class Configuration
    attr_accessor :user, :password, :administrative_code,
      :contract, :card

    def authenticate
      @authenticate ||=
        Authenticate.new(
          user: user, password: password,
          administrative_code: administrative_code,
          contract: contract, card: card
        )
    end
  end
end
