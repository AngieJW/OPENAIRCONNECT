class List < ApplicationRecord
  belongs_to :event

  validates :item, presence: true
end
