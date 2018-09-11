class Photo < ApplicationRecord
  dragonfly_accessor :image do
    after_assign do |attachment|
      # Auto orient all the images - so they will look as they should
      attachment.convert! '-auto-orient'
    end
  end

  has_one :months_photo
  has_one :month, through: :months_photo
  has_many :places_photos
  has_many :places, through: :places_photos
end
