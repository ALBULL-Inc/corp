class Place < ApplicationRecord
  validates :organization_id, :name, :key, presence: true
  validates :key, uniqueness: true

  belongs_to :organization

  def to_param
    self.key
  end
end
