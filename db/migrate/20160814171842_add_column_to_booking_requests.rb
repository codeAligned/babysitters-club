class AddColumnToBookingRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :booking_requests, :desired_time, :datetime
  end
end
