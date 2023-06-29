class ItemBring < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :item
end
