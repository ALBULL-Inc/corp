class Place < ApplicationRecord
  dragonfly_accessor :captain_thumbnail

  validates :organization_id, :name, :key, presence: true
  validates :key, uniqueness: true

  belongs_to :organization

  has_many :places_photos
  has_many :photos, through: :places_photos

  default_scope ->{ order(:position) }
  scope :enables, ->{ where(arel_table[:enable].eq(true)) }

  def to_param
    self.key
  end
end
