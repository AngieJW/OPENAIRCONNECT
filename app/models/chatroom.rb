class Chatroom < ApplicationRecord
  belongs_to :booking
  belongs_to :event, through: :booking, optional: true
end
