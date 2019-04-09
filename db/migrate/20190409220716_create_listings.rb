class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :address
      t.integer :price
      t.string :amenities
      t.string :description
      t.text :image_location

      t.timestamps
    end
  end
end
