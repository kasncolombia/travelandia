class Hotel < ApplicationRecord
  belongs_to :destination

  validates :name, :price_per_night, presence: true
  validates :stars, numericality: { in: 1..5 }
end
