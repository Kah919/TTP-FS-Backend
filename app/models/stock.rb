class Stock < ApplicationRecord
  validates :ticker, uniqueness: { case_sensitive: false }
  has_many :transactions
  has_many :users, through: :transactions
end
