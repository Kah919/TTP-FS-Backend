class StockSerializer < ActiveModel::Serializer
  attributes :id, :name, :ticker, :num_shares, :curr_price
end
