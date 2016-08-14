class BabysitterSerializer < ActiveModel::Serializer
 attributes :name, :email, :reviews, :average_review
 has_many :parents
 has_many :requests
 has_many :booking_requests
 has_many :bookings
end
