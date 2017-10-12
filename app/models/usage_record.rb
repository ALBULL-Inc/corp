class UsageRecord < ApplicationRecord
  belongs_to :month
  belongs_to :child
  belongs_to :place
end
