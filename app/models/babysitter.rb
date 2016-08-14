class Babysitter < ApplicationRecord
  has_many :parent_babysitters
  has_many :parents, through: :parent_babysitters
  has_many :bookings
  has_many :requests

  def reviews
    Review.joins_table.where('babysitter_id=?', self.id)
  end
end
