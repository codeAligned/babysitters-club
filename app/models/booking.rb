class Booking < ApplicationRecord
  belongs_to :parent
  belongs_to :babysitter

  # sort bookings by date
  def self.sort_by_date
    self.all.sort_by do |booking|
      booking.datetime
    end
  end

end
