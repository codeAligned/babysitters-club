class ParentSerializer < ActiveModel::Serializer
 attributes :name, :email
 has_many :babysitters
 has_many :requests
 has_many :bookings
end
