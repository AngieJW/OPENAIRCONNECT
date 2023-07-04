class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  def from_current_user?
    user == Current.user
  end
end
