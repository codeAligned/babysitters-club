class Parent < ApplicationRecord
  belongs_to :user
  has_many :parent_babysitters
  has_many :babysitters, through: :parent_babysitters
  has_many :bookings
  has_many :booking_requests
  has_many :requests
  has_many :reviews

  def self.search(search)
    Parent.joins(:user).where('lower(name) LIKE ?', "%#{search.downcase}%")
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

  def network_with_current_user_info(id)
    current_parent_user = User.find(id).associated_user
    self.network_hash.each do |babysitter|
      if current_parent_user.babysitters.include?(babysitter)
        babysitter[:button_value] = "IN CURRENT USER NETWORK"
      elsif !!current_parent_user.requests.find_by(babysitter_id: babysitter[:id])
        babysitter[:button_value] = "PENDING NETWORK REQUEST"
      else
        babysitter[:button_value] = "SHOW BUTTON"
      end
    end
  end

  def network_hash
    self.babysitters.map do |babysitter|
      {
        id: babysitter.id,
        user_id: babysitter.user_id,
        name: babysitter.name,
        email: babysitter.email,
        location: babysitter.location,
        bio: babysitter.bio,
        skills: babysitter.skills,
        profile_pic: babysitter.user.profile_pic
      }
    end
  end

  def network(id)
    self.network_with_current_user_info(id).map do |babysitter|
      {
        id: babysitter[:id],
        user_id: babysitter[:user_id],
        name: babysitter[:name],
        email: babysitter[:email],
        location: babysitter[:location],
        bio: babysitter[:bio],
        skills: babysitter[:skills],
        button_value: babysitter[:button_value],
        profile_pic: babysitter.user.profile_pic
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
