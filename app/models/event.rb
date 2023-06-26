class Event < ApplicationRecord
  belongs_to :hike
  belongs_to :user

  validates :meeting_date, presence: true
  validates :meeting_time, presence: true
  validates :meeting_point, presence: true
  validates :group_size, presence: true
end
