class RemoveDesiredTimeFromBookingRequest < ActiveRecord::Migration[5.0]
  def change
    remove_column :booking_requests, :desired_time, :datetime
  end
end
