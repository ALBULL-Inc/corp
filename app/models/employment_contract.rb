class EmploymentContract < ApplicationRecord
  belongs_to :organization
  belongs_to :staff
end
