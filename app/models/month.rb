class Month < ApplicationRecord
  default_scope ->{ order(ym: :desc) }

  has_many :months_photos
  has_many :photos, through: :months_photos

  def title
    return @title if @title
    s_ym = self.ym.to_s
    y,m = s_ym[0,4], s_ym[4,2]
    @title = "#{y}年#{m}月"
  end
end
