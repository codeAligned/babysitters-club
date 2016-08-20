class BookingRequest < ApplicationRecord
  belongs_to :parent
  belongs_to :babysitter

  def self.accept(id)
    byebug
    booking = BookingRequest.find(id)
    Booking.create({parent_id: booking.parent_id, babysitter_id: booking.babysitter_id, desired_time: booking.desired_time, duration: booking.duration})
    booking.destroy
  end
end
