class AddDesiredTimeToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :desired_time, :string
  end
end
