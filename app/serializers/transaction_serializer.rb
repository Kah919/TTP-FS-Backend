class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :stock_id, :num_share
  belongs_to :user
  belongs_to :stock
end
