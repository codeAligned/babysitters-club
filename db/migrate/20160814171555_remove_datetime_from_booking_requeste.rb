class RemoveDatetimeFromBookingRequeste < ActiveRecord::Migration[5.0]
  def change
    remove_column :booking_requests, :datetime, :datetime
  end
end
