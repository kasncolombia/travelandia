class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :destination
  has_many :itinerary_days, dependent: :destroy

  validates :title, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w[draft active completed] }

  scope :active, -> { where(status: :active) }
  scope :recent, -> { order(created_at: :desc) }
end
