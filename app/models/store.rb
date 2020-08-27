class Store < ApplicationRecord
  validates :pkey, presence: true

  belongs_to :organization

  has_many :menus
  has_many :parties
  has_many :topics, as: :topicable

  default_scope ->{ order(:position) }
  scope :enables, ->{ where(arel_table[:enable].eq(true)) }

  def full_address
    @full_address ||= [self.region, self.locality, self.address, " ", self.building].join
  end
end
