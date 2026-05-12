class CreateItineraryActivities < ActiveRecord::Migration[8.1]
  def change
    create_table :itinerary_activities do |t|
      t.references :itinerary_day, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :time_slot
      t.string :category
      t.float :cost
      t.boolean :booking_required

      t.timestamps
    end
  end
end
