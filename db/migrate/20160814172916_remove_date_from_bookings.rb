class RemoveDateFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :date, :date
    remove_column :bookings, :time, :time
  end
end
