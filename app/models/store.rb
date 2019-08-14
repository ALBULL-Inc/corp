class Store < ApplicationRecord
  default_scope ->{ order(:position) }
  scope :enables, ->{ where(arel_table[:enable].eq(true)) }

  def full_address
    @full_address ||= [self.region, self.locality, self.address].join
  end

  def change_hour
    @change_hour = 12 #12時で営業日を切り替える
  end

  def ymd(dt=nil)
    dt ||= DateTime.current
    if dt.hour < self.change_hour
      dt = DateTime.yesterday
    end
    dt.ymd
  end
end
