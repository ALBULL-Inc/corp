class Organization < ApplicationRecord
  validates :name, presence: true

  has_many :organizations_places
  has_many :places, through: :organizations_places
end
