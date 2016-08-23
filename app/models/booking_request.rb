class BookingRequest < ApplicationRecord
  belongs_to :parent
  belongs_to :babysitter

  # had to take out desired_date: booking.desired_date to get it to function
  def self.accept(id)
    booking = BookingRequest.find(id)
    Booking.create({parent_id: booking.parent_id, babysitter_id: booking.babysitter_id, desired_time: booking.desired_time, duration: booking.duration})
    booking.destroy
  end
end
