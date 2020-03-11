class Staff < ApplicationRecord
  has_one :employment_contract
  has_one :employer, through: :employment_contract, source: :organization
  has_many :stores_staffs
  has_many :stores, through: :stores_staffs
  has_many :stamped_dailies, ->{ order(ymd: :asc) }

  accepts_nested_attributes_for :stores_staffs, allow_destroy: true

  default_scope ->{ order(code: :asc) }

  def name
    @name ||= "#{self.last_name} #{self.first_name}"
  end
end
