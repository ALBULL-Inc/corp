class Staff < ApplicationRecord
  belongs_to :organization
  has_many :stamped_dailies

  default_scope ->{ order(code: :asc) }

  def name
    @name ||= "#{self.last_name} #{self.first_name}"
  end
end
