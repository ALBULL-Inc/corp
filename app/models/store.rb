class Store < ApplicationRecord
  validates :pkey, presence: true

  belongs_to :organization

  has_many :stores_menus
  has_many :menus, through: :stores_menus
  has_many :parties
  has_many :topics, as: :topicable

  default_scope ->{ order(:position) }
  scope :enables, ->{ where(arel_table[:enable].eq(true)) }

  def full_address
    @full_address ||= [self.region, self.locality, self.address, " ", self.building].join
  end

  def snsids
    @snsids ||= {fb: self.facebook_uid, ig: self.instagram_uid, tw: self.twitter_uid}
  end
end
