class Booking < ApplicationRecord
  belongs_to :parent
  belongs_to :babysitter

  #sort bookings by date 
  def self.sortByDate
  	self.sort_by do |booking| 
  		booking.date
  	end
  end
end
