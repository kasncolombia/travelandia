class CreateDestinations < ActiveRecord::Migration[8.1]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :country
      t.text :description
      t.string :cover_image
      t.float :rating
      t.string :price_range
      t.string :currency
      t.string :language
      t.string :best_season
      t.string :timezone

      t.timestamps
    end
  end
end
