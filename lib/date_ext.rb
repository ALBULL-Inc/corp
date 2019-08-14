class Date
  def self.ymd
    Date.today.strftime("%Y%m%d").to_i
  end

  def ymd
    self.strftime("%Y%m%d").to_i
  end
end

class Time
  def ymd
    self.to_date.ymd
  end
end
