class Topic < ActiveRecord::Base
  default_scope ->{ order(publish_at: :desc) }
  scope :enables, ->{ where(arel_table[:enable].eq(true).and( arel_table[:publish_at].lteq(DateTime.current)) ) }
  scope :carousels, ->{ enables.where(arel_table[:carousel].eq(true)) }
end
