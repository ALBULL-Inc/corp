class Place < ApplicationRecord
  dragonfly_accessor :captain_thumbnail

  validates :organization_id, :name, :key, presence: true
  validates :key, uniqueness: true

  belongs_to :organization

  has_many :children
  has_many :places_photos
  has_many :photos, through: :places_photos
  has_many :photos_months, through: :photos, source: :month
  has_many :usage_records

  default_scope ->{ order(:position) }
  scope :enables, ->{ where(arel_table[:enable].eq(true)) }

  def to_param
    self.key
  end

  def allow?(family)
    family.present? && family.allow_place_ids.include?(self.id)
  end
end
