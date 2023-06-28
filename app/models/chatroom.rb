class Chatroom < ApplicationRecord
  belongs_to :event, optional: true
end
