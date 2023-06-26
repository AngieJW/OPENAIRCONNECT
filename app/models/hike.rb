class Hike < ApplicationRecord
  belongs_to :event, presence: true
  validates :distance, presence: true
  validates :elevation, presence: true
  validates :duration, presence: true
  validates :starting_lat, presence: true
  validates :starting_lng, presence: true
  validates :ending_lat, presence: true
  validates :ending_lng, presence: true
end
