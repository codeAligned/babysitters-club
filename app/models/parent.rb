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

  def network
    self.babysitters.map do |babysitter| 
      {id: babysitter.id, 
        user_id: babysitter.user_id, 
        name: babysitter.name,
        email: babysitter.email, 
        location: babysitter.location,
        bio: babysitter.bio,
        skills: babysitter.skills
      }
    end 
  end 

  def network_requests
    self.requests.map do |request| 
      {id: request.id,
        babysitter: Babysitter.find(request.babysitter_id), 
        babysitter_name: Babysitter.find(request.babysitter_id).name
      }
    end 
  end 

  def email
    self.user.email
  end

  def reviews
    Review.joins_table.where('parent_id=?', self.id)
  end


end
