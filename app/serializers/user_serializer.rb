class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :balance
  has_many :transactions
  has_many :stocks, through: :transactions
end
