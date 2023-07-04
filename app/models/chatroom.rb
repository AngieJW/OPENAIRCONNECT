class Chatroom < ApplicationRecord
  belongs_to :event, optional: true
  has_many :messages, dependent: :destroy
end
