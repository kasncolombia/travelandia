class CreateItineraries < ActiveRecord::Migration[8.1]
  def change
    create_table :itineraries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :destination, null: false, foreign_key: true
      t.string :title
      t.date :start_date
      t.date :end_date
      t.float :budget
      t.integer :status
      t.string :travel_style

      t.timestamps
    end
  end
end
