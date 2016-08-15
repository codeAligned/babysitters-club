class Babysitter < ApplicationRecord
  has_many :parent_babysitters
  has_many :parents, through: :parent_babysitters
  has_many :bookings
  has_many :booking_requests
  has_many :requests

  def reviews
    Review.joins_table.where('babysitter_id=?', self.id)
  end

  def total_review_number
    total = 0
    # use a higher level iterator here (inject?)
    reviews.each{|review| total+=review[:rating]}
    return total
  end

  def average_review
    length = reviews.count
    return total_review_number/length
  end

end
