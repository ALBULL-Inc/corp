class StampedDaily < ApplicationRecord
  module STATUS
    CLOSED = 10
    FIXED  = 99
  end
  belongs_to :staff
  has_many :stamped_eaches

  def worked_sec
    return 0 if self.work_end_at.nil? || self.work_start_at.nil?
    (self.work_end_at - self.work_start_at)
  end

  def worked_hm
    "%02d:%02d" % worked_sec.div(1.minute).divmod(60)
  end
end
