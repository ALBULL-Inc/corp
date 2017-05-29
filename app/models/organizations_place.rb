class OrganizationsPlace < ApplicationRecord
  validates :place_id, uniqueness: true

  belongs_to :organization
  belongs_to :place
end
