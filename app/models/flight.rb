class Flight < ApplicationRecord
  validates :origin, :destination, :airline, :price, presence: true
end
