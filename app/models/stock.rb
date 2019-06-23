class Stock < ApplicationRecord
  has_many :users, through: :transactions
end
