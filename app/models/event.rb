class Event < ApplicationRecord
  belongs_to :hike
  belongs_to :user
  belongs_to :memory, optional: true
  has_many :items, dependent: :destroy
  has_many :bookings
  has_many :users, through: :bookings

  validates :meeting_date, :meeting_point, :meeting_time, presence: true
  # LEVELS = ["balade", "adapté aux enfants", "intermédiaire", "difficile"]
  # validates :difficulty, inclusion: { in: LEVELS }
end
