class Destination < ApplicationRecord
  has_many :hotels, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :itineraries, dependent: :destroy

  validates :name, :country, presence: true
  validates :name, uniqueness: { scope: :country }

  scope :popular, -> { order(rating: :desc) }
  scope :by_country, ->(country) { where(country: country) }
end
