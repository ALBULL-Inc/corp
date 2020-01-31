class EmploymentContract < ApplicationRecord
  belongs_to :organization
  belongs_to :staff

  # has_many :salaries #ここで給与保持する?基本給で1レコード。手当で1レコードとか。
end
