class EmploymentContract < ApplicationRecord
  belongs_to :organization
  belongs_to :staff
  belongs_to :workplace

  # has_many :salaries #ここで給与保持する?基本給で1レコード。手当で1レコードとか。

  def employment_type_name
    @employment_type_name ||= I18n.t(EmploymentType::WORDS[self.employment_type])
  end
end
