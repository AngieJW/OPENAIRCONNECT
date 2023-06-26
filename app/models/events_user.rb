class EventsUser < ApplicationRecord
  belongs_to :users
  belongs_to :event
  belongs_to :memory
  belongs_to :chatroom
end
