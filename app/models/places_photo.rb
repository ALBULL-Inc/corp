class PlacesPhoto < ApplicationRecord
  belongs_to :place
  belongs_to :photo
end
