class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :avatar
      t.integer :travel_level
      t.jsonb :preferences
      t.boolean :pro_subscriber

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
