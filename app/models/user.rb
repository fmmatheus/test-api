class User < ApplicationRecord
  require 'correios-cep'

  # validations
  validates_presence_of :name, :email, :address
  validate              :set_address

  def set_address
    self.address = Correios::CEP::AddressFinder.get(self.address)
  end
end
