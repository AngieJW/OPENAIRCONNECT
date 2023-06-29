class Item < ApplicationRecord
  belongs_to :event
  has_many :item_brings

  validates :name, presence: true
end
