class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :email, :password
  has_one :parent
  has_one :babysitter
end
