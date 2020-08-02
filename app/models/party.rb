class Party < ApplicationRecord
  belongs_to :store

  scope :enables, ->{ where(enable: true) }
end
