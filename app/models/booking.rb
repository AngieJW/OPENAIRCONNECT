class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :memory
  belongs_to :chatroom
end
