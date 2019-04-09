class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :payment_info
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
