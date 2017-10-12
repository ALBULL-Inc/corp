class Child < ApplicationRecord
  validates :place_id, :first_name, presence: true
  validates :family_id_or_family_title, presence: true

  belongs_to :family
  belongs_to :place

  has_many :usage_records
  has_many :months, through: :usage_records

  accepts_nested_attributes_for :family, reject_if: proc { |prms| prms['title'].blank? }

  def used!(place, month)
    UsageRecord.create!(place: place, month: month, child: self)
  end

  private
  def family_id_or_family_title
    family_id.present? or family&.title
  end
end
