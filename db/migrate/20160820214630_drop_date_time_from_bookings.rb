class DropDateTimeFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :datetime, :datetime
  end
end
