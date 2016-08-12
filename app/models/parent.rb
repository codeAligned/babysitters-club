class Parent < ApplicationRecord
  has_many :parent_babysitters
  has_many :babysitters, through: :parent_babysitters
  has_many :bookings
end
