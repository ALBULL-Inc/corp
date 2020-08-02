class Staff < ApplicationRecord
  validates :code, presence: true # FIXME エラーメッセージ出ない

  has_one :profile, as: :profileable, dependent: :destroy
  has_one :current_contract, ->{ where(expiration_on: nil) }, class_name: :EmploymentContract
  has_one :employer, through: :current_contract, source: :organization
  has_one :workplace, through: :current_contract
  has_many :stamped_dailies, ->{ order(ymd: :asc) }

  accepts_nested_attributes_for :current_contract

  default_scope ->{ order(code: :asc) }

  def to_param
    self.code
  end

  def name
    @name ||= "#{self.last_name} #{self.first_name}"
  end
end
