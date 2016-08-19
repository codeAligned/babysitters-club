class Parent < ApplicationRecord
  belongs_to :user
  has_many :parent_babysitters
  has_many :babysitters, through: :parent_babysitters
  has_many :bookings
  has_many :booking_requests
  has_many :requests

  def self.search(search)
    User.joins_table_parents.where("name LIKE ?", search.capitalize)
  end

  def name
    self.user.name
  end

  def network
    self.babysitters.map do |babysitter|
      {
        id: babysitter.id,
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
      {
        id: request.id,
        babysitter: request.babysitter,
        babysitter_name: request.babysitter.name
      }
    end
  end

  def confirmed_bookings
    self.bookings.map do |booking|
      {
        id: booking.id,
        time: booking.desired_time,
        duration: booking.duration,
        account: booking.babysitter,
        name: booking.babysitter.name
      }
    end
  end

  def requested_bookings
    self.booking_requests.map do |booking_request|
      {
        id: booking_request.id,
        time: booking_request.desired_time,
        duration: booking_request.duration,
        account: booking_request.babysitter,
        name: booking_request.babysitter.name
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
