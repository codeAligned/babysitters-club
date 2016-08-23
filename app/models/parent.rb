class Parent < ApplicationRecord
  belongs_to :user
  has_many :parent_babysitters
  has_many :babysitters, through: :parent_babysitters
  has_many :bookings
  has_many :booking_requests
  has_many :requests
  has_many :reviews

  def self.search(search)
    Parent.all.select do |parent|
      parent.name.downcase==search.downcase
    end
  end

  def user_id
    self.user.id
  end

  def username
    self.user.username
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
        date: booking.desired_date,
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
        date: booking_request.desired_date,
        duration: booking_request.duration,
        account: booking_request.babysitter,
        name: booking_request.babysitter.name
      }
    end
  end

  def email
    self.user.email
  end



end
