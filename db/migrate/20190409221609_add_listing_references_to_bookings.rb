class AddListingReferencesToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :listing, foreign_key: true
  end
end
