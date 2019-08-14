class StampedDaily < ApplicationRecord
  module STATUS
    CLOSED = 10
    FIXED  = 99
  end
  belongs_to :staff
  has_many :stamped_eaches

  def worked_time
    return nil if self.work_end_at.nil? || self.work_start_at.nil?
    Time.parse("1/1") + (self.work_end_at - self.work_start_at)
  end
end
