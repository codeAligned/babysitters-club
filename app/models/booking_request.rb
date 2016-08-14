class BookingRequest < ApplicationRecord
  belongs_to :parent
  belongs_to :babysitter

  def accept()
    Booking.create({parent_id: self.parent_id, babysitter_id: self.babysitter_id, desired_time: self.desired_time, duration: self.duration})
    # destroy booking request
  end
end
