class Photo < ApplicationRecord
  dragonfly_accessor :image

  has_many :months
end
