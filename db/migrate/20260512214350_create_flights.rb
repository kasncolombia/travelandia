class CreateFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :flights do |t|
      t.string :origin
      t.string :destination
      t.string :airline
      t.datetime :departure_time
      t.datetime :arrival_time
      t.float :price
      t.integer :duration
      t.integer :stops

      t.timestamps
    end
  end
end
