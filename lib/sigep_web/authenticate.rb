module SigepWeb
  class Authenticate
    attr_accessor :user, :password, :administrative_code,
      :contract, :card

    def initialize(options = {})
      self.user = options[:user]
      self.password = options[:password]
      self.administrative_code = options[:administrative_code]
      self.contract = options[:contract]
      self.card = options[:card]
    end
  end
end
