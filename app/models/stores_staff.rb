class StoresStaff < ApplicationRecord
  belongs_to :store
  belongs_to :staff
end
