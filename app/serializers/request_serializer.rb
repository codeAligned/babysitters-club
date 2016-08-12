class RequestSerializer < ActiveModel::Serializer
  attributes :id
  has_one :parent
  has_one :babysitter
end
