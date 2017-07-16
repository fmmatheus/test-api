class User < ApplicationRecord
  require 'correios-cep'

  before_save { email.downcase! }

  # validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :name
  validates_presence_of :email, format: { with: VALID_EMAIL_REGEX }
  validates_presence_of :address, :set_address

  def set_address
    self.address = Correios::CEP::AddressFinder.get(self.address)
  end
end
