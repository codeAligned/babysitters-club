class DropDesiredTimeFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :desired_time, :datetime

  end
end
