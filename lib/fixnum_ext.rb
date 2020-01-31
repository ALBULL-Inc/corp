class Fixnum
  # only use yyyymmdd
  def to_date
    if self.size == 8
      year = self.to_s.slice(0,4).to_i
      month = self.to_s.slice(4,2).to_i
      day = self.to_s.slice(6,2).to_i
      return Date.new(year, month, day)
    end
    raise
  end
end
