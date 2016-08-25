class BabysitterSerializer < ActiveModel::Serializer
 attributes :age, :location, :bio, :skills, :username, :name, :user_id
 # belongs_to :user
 # has_many :parents
 # has_many :requests
 # has_many :booking_requests
 # has_many :bookings
end
