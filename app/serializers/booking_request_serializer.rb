class BookingRequestSerializer < ActiveModel::Serializer
  attributes :id, :babysitter_id, :desired_time, :duration, :desired_date
  has_one :parent
  has_one :babysitter
end
