class Store < ApplicationRecord
  default_scope ->{ order(:position) }
  scope :enables, ->{ where(arel_table[:enable].eq(true)) }

  def full_address
    @full_address ||= [self.region, self.locality, self.address].join
  end
end
