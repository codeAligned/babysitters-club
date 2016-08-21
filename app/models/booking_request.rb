class BookingRequest < ApplicationRecord
  belongs_to :parent
  belongs_to :babysitter

  def self.accept(id)
    booking = BookingRequest.find(id)
    byebug
    Booking.create({parent_id: booking.parent_id, babysitter_id: booking.babysitter_id, desired_time: booking.desired_time, duration: booking.duration, desired_date: booking.desired_date})
    booking.destroy
  end
end
