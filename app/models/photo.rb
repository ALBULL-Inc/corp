class Photo < ApplicationRecord
  dragonfly_accessor :image

  has_one :months_photo
  has_one :month, through: :months_photo
  has_many :places_photos
  has_many :places, through: :places_photos
end
