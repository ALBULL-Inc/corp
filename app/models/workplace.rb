class Workplace < ApplicationRecord
  belongs_to :organization
  has_many :employment_contracts
  has_many :staffs, through: :employment_contracts

  def date_change_hour
    10
  end

  def ymd(dt=nil)
    dt ||= DateTime.current
    if dt.hour < self.date_change_hour
      dt = dt.yesterday
    end
    dt.ymd
  end
end
