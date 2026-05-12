class User < ApplicationRecord
  has_many :itineraries, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
