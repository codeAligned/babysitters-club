class UserSerializer < ActiveModel::Serializer
  attributes :id, :associated_user, :username, :name, :email
end
