class Event < ApplicationRecord
  belongs_to :hike
  belongs_to :user
  belongs_to :memory, optional: true
  has_many :items, dependent: :destroy

  validates :meeting_date, :meeting_point, :meeting_time, presence: true
end
