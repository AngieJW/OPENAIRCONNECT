class Booking < ApplicationRecord
  has_many :users
  
  belongs_to :event
  belongs_to :memory
  belongs_to :chatroom
end
