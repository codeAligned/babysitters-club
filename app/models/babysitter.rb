class Babysitter < ApplicationRecord
  belongs_to :user
  has_many :parent_babysitters
  has_many :parents, through: :parent_babysitters
  has_many :bookings
  has_many :booking_requests
  has_many :requests

  def reviews
    Review.joins_table.where('babysitter_id=?', self.id)
  end

  def network
    self.parents.map do |parent| 
      {id: parent.id, 
        user_id: parent.user_id, 
        name: parent.name,
        email: parent.email, 
        address: parent.address,
        kid_count: parent.kid_count,
        specific_needs: parent.specific_needs,
        extra_requests: parent.extra_requests
      }
    end 
  end 

  def network_requests  
    self.requests.map do |request| 
      {id: request.id,
        parent: Parent.find(request.parent_id), 
        parent_name: Parent.find(request.parent_id).name
      }
    end 
  end 

   def booking_requests
    self.bookings.map do |booking| 
      {id: booking.id,
        babysitter: Parent.find(booking.parent_id), 
        babysitter_name: Babysitter.find(booking.parent_id).name
      }
    end 
  end


  def total_review_number
    total = 0
    # use a higher level iterator here (inject?)
    reviews.each{|review| total+=review[:rating]}
    return total
  end

  def average_review
    length = reviews.count
    # total_review_number/length
    return nil
  end

  def name
    self.user.name
  end

  def email
    self.user.email
  end

end
