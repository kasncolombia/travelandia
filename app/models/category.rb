class Category < ApplicationRecord
  has_many :subcategories, dependent: :destroy

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true
end
