class Parent < ApplicationRecord
  has_many :parent_babysitters
  has_many :babysitters, through: :parent_babysitters
  has_many :bookings
  has_many :requests

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end


end
