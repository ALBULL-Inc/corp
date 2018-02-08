class RecruitCondition
  attr_accessor :employment_type

  def condition
    conds = []
    if self.employment_type
      conds << Recruit.where(employment_type: self.employment_type)
    end
    return nil if conds.blank?
    conds.inject(conds.first){|r,c| r.merge(c)}
  end
end
