class Review < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  validates :rating, presence: true, numericality: { in: 1..5 }
  validates :content, presence: true
end
