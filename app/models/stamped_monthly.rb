class StampedMonthly
  attr_accessor :staff, :target_month

  def initialize(staff,year,month)
    @staff = staff
    @target_month = Date.new(year, month)
    @target_month_first_day = @target_month.beginning_of_month
    @target_month_last_day = @target_month_first_day.end_of_month
  end

  def stamped_dailies
    @stamped_dailies ||= @staff.stamped_dailies.
      where(ymd:(@target_month_first_day.ymd..@target_month_last_day.ymd))
  end

  def worked_sec
    @worked_sec ||= stamped_dailies.map(&:worked_sec).sum
  end
  def worked_hm
    @worked_hm ||= "%02d:%02d" % worked_sec.div(1.minute).divmod(60)
  end
end
