class AddDesiredDateToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :desired_date, :string
  end
end
