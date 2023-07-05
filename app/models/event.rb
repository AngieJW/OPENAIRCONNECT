class Event < ApplicationRecord
  belongs_to :hike
  belongs_to :user
  belongs_to :memory, optional: true
  has_many :items, dependent: :destroy
  has_many :bookings
  has_many :users, through: :bookings
  has_one :chatroom, dependent: :destroy

  validates :meeting_date, :location, :meeting_time, presence: true

end
