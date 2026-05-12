class UpdateSubcategorySlugIndex < ActiveRecord::Migration[8.1]
  def change
    remove_index :subcategories, :slug if index_exists?(:subcategories, :slug)
    add_index :subcategories, [:category_id, :slug], unique: true
  end
end
