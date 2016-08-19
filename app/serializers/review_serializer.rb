class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :rating 
  belongs_to :parent_babysitter
end
