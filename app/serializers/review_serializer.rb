class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :review, :rating
  has_one :parent
  has_one :babysitter
end
