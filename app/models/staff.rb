class Staff < ApplicationRecord
  has_many :employment_contracts
  # has_many :employers, through: :employment_contracts,source: :organization
  has_many :stores_staffs
  has_many :stores, through: :stores_staffs
  has_many :stamped_dailies

  accepts_nested_attributes_for :stores_staffs, allow_destroy: true

  default_scope ->{ order(code: :asc) }

  def name
    @name ||= "#{self.last_name} #{self.first_name}"
  end
end
