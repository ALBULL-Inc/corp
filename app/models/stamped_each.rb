class StampedEach < ApplicationRecord
  belongs_to :stamped_daily
  belongs_to :staff
  belongs_to :store

  after_save :stamping_daily

  def stamped_type
    I18n.t(StampedType::WORDS[self.stamped_type_id])
  end

  def rounded_at(s=1.minute)
    self.stamped_at.floor_to(s)
  end

  def stamped_text
    %{#{self.staff.name}さんが#{I18n.l(self.rounded_at, format: :hm)}に#{stamped_type}しました}
  end

  private
    def stamping_daily
      case self.stamped_type_id
      when StampedType::WORKING_START
        self.stamped_daily.work_start_at ||= self.rounded_at
      when StampedType::WORKING_END
        self.stamped_daily.work_end_at = self.rounded_at
      end
      self.stamped_daily.save
    end
end
