class Event < ApplicationRecord
  belongs_to :hike
  belongs_to :user
  belongs_to :lists
  belongs_to :booking

  validates :meeting_date, :meeting_point, :meeting_time, presence: true
end
