class Store < ApplicationRecord
  default_scope ->{ order(:position) }
  scope :enables, ->{ where(arel_table[:enable].eq(true)) }

  def full_address
    [self.city, self.address].join
  end
end
