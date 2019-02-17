class DartsliveCard < ApplicationRecord
  validates :no, presence: true

  belongs_to :account

  before_save :sync, if: :password?

  def dartslive
    return nil if self.password.blank?
    @dartslive ||= Dartslive.new
    @dartslive.login!(self.no, self.password) unless @dartslive.logged_in
    @dartslive
  end

  def sync
    return nil unless dartslive
    self.name = dartslive.cardname
    self.stats = dartslive.stats.to_json
  end
  def sync!
    sync&.save
  end

  def stats_hash
    @stats_hash ||= self.stats.nil? ? {} : JSON.parse(self.stats)
  end
  def ratings
    @ratings ||= stats_hash["rating"] || {}
  end
  def zeroones
    @zeroones ||= stats_hash["zeroone"] || {}
  end
  def crickets
    @crickets ||= stats_hash["cricket"] || {}
  end
  def countups
    @countups ||= stats_hash["countup"] || {}
  end
end
