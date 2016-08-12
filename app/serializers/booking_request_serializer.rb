class BookingRequestSerializer < ActiveModel::Serializer
  attributes :id, :datetime, :duration
  has_one :parent
  has_one :babysitter
end
