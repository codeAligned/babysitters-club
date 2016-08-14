class AddDesiredtimeToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :desired_time, :datetime
  end
end
