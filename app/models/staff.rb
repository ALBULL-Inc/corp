class Staff < ApplicationRecord
  has_one :employment_contract
  has_one :employer, through: :employment_contract
  has_many :stores_staffs
  has_many :stores, through: :stores_staffs
  has_many :stamped_dailies

  default_scope ->{ order(code: :asc) }

  def name
    @name ||= "#{self.last_name} #{self.first_name}"
  end
end
