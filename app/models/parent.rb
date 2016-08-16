class Parent < ApplicationRecord
  belongs_to :user
  has_many :parent_babysitters
  has_many :babysitters, through: :parent_babysitters
  has_many :bookings
  has_many :booking_requests
  has_many :requests

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  def name
    self.user.name
  end

  def email
    self.user.email
  end

  def reviews
    Review.joins_table.where('parent_id=?', self.id)
  end


end
