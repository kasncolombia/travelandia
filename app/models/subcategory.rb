class Subcategory < ApplicationRecord
  belongs_to :category

  validates :name, :slug, presence: true
  validates :slug, uniqueness: { scope: :category_id }
end
