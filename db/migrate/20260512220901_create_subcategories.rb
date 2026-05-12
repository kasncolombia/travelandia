class CreateSubcategories < ActiveRecord::Migration[8.1]
  def change
    create_table :subcategories do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :subcategories, :slug, unique: true
  end
end
