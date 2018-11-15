class Party < ApplicationRecord
  scope :enables, ->{ where(enable: true) }
end
