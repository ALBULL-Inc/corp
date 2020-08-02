class StampedDaily < ApplicationRecord
  module STATUS
    CLOSED = 10
    FIXED  = 99
  end
  belongs_to :staff
  has_many :stamped_eaches

  def worked_sec
    return @worked_sec if @worked_sec
    @worked_sec = if self.work_end_at.nil? || self.work_start_at.nil?
      0
    else
      (self.work_end_at - self.work_start_at)
    end
  end
  def worked_hour
    @worked_hour ||= (self.worked_sec / 1.hour).ceil(2)
  end
  def worked_hm
    @worked_hm ||= "%02d:%02d" % worked_sec.div(1.minute).divmod(60)
  end

  def fixed_sec
    @fixed_sec ||= (self.worked_sec - self.overtime_sec)
  end
  def fixed_hour
    @fixed_hour ||= (self.fixed_sec / 1.hour).ceil(2)
  end
  def fixed_hm
    @fixed_hm ||= "%02d:%02d" % fixed_sec.div(1.minute).divmod(60)
  end

  def overtime_sec
    @overtime_sec ||= (s = worked_sec - 8.hour) > 0 ? s : 0
  end
  def overtime_hour
    @overtime_hour ||= (self.overtime_sec / 1.hour).ceil(2)
  end
  def overtime_hm
    @overtime_hm ||= "%02d:%02d" % overtime_sec.div(1.minute).divmod(60)
  end

  def midnight_sec
    return 0 if self.work_end_at.blank?
    dt = DateTime.parse("#{self.ymd}220000 +0900")
    dt = self.work_start_at if dt < self.work_start_at
    mid = self.work_end_at - dt
    return 0 if mid <= 0
    dt = DateTime.parse("#{self.ymd.to_date.next.ymd}050000 +0900")
    mid2 = self.work_end_at - dt
    mid2 = 0 if mid2 < 0
    return mid - mid2
  end
  def midnight_hour
    @midnight_hour ||= (self.midnight_sec / 1.hour).ceil(2)
  end
  def midnight_hm
    @midnight_hm ||= "%02d:%02d" % midnight_sec.div(1.minute).divmod(60)
  end

  def date
    @date ||= self.ymd.to_date
  end
end
