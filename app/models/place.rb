class Place < ApplicationRecord
  validates :organization_id, :name, :key, presence: true
  validates :key, uniqueness: true

  belongs_to :organization

  has_many :places_photos
  has_many :photos, through: :places_photos

  def to_param
    self.key
  end
end
