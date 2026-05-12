class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :destination, null: false, foreign_key: true
      t.integer :rating
      t.text :content
      t.text :pros
      t.text :cons
      t.date :visit_date

      t.timestamps
    end
  end
end
