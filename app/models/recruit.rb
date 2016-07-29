class Recruit < ActiveRecord::Base
  default_scope ->{ enables.order(position: :desc) }
  scope :enables, ->{ where(arel_table[:enable].eq(true)) }
end
