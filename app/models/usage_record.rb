class UsageRecord < ApplicationRecord
  belongs_to :month
  belongs_to :child
  belongs_to :place

  scope :by_place, ->(place){ where(place: place) }
  scope :by_month, ->(month){ where(month: month) }
end
