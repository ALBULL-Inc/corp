class StampedMonthly
  attr_accessor :staff, :date
  attr_reader :first_day, :last_day

  def initialize(staff,year,month)
    @staff = staff
    @date = Date.new(year, month)
    @first_day = @date.beginning_of_month
    @last_day = @first_day.end_of_month
  end

  def stamped_dailies
    @stamped_dailies ||= @staff.stamped_dailies.
      where(ymd:(first_day.ymd..last_day.ymd))
  end

  def worked_sec
    @worked_sec ||= stamped_dailies.map(&:worked_sec).sum
  end
  def worked_hm
    @worked_hm ||= "%02d:%02d" % worked_sec.div(1.minute).divmod(60)
  end

  def overtime_sec
    @overtime_sec ||= stamped_dailies.map(&:overtime_sec).sum
  end
  def overtime_hm
    @overtime_hm ||= "%02d:%02d" % overtime_sec.div(1.minute).divmod(60)
  end
  def midnight_sec
    @midnight_sec ||= stamped_dailies.map(&:midnight_sec).sum
  end
  def midnight_hm
    @midnight_hm ||= "%02d:%02d" % midnight_sec.div(1.minute).divmod(60)
  end

  def next_date
    @next_date ||= self.date.next_month
  end
  def next_year
    @next_year ||= self.next_date.year
  end
  def next_month
    @next_month ||= self.next_date.month
  end
  def prev_date
    @prev_date ||= self.date.prev_month
  end
  def prev_year
    @prev_year ||= self.prev_date.year
  end
  def prev_month
    @prev_month ||= self.prev_date.month
  end
end
