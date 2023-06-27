class Event < ApplicationRecord
  belongs_to :hike
  belongs_to :user
  has_many :items, dependent: :destroy
  has_one :chatroom, through: :booking
  has_one :memory, through: :booking

  validates :meeting_date, :meeting_point, :meeting_time, presence: true
end
