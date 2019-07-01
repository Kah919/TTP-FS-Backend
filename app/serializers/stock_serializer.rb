class StockSerializer < ActiveModel::Serializer
  attributes :id, :name, :ticker, :open_price
  has_many :transactions
  has_many :users, through: :transactions
end
