class Organization < ApplicationRecord
  # has_many :working_regulations
  # has_one :regulation
  has_many :employment_contracts
  has_many :employees, through: :employment_contracts, source: :staff
  has_many :stores
end
