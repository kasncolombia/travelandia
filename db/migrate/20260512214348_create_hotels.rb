class CreateHotels < ActiveRecord::Migration[8.1]
  def change
    create_table :hotels do |t|
      t.references :destination, null: false, foreign_key: true
      t.string :name
      t.integer :stars
      t.float :price_per_night
      t.float :rating
      t.text :amenities
      t.text :images

      t.timestamps
    end
  end
end
