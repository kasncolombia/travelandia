class ItineraryActivity < ApplicationRecord
  belongs_to :itinerary_day

  validates :title, presence: true
end
