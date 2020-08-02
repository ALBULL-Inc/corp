class OrganizationsAccount < ApplicationRecord
  belongs_to :organization
  belongs_to :account
end
