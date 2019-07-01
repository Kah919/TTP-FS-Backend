class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  has_many :transactions
  has_many :stocks, through: :transactions
end
