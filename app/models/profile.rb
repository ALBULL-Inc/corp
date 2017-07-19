class Profile < ApplicationRecord
  belongs_to :account

  has_many :contacts, dependent: :destroy
  accepts_nested_attributes_for :contacts, allow_destroy: true
  has_many :backgrounds, dependent: :destroy
  accepts_nested_attributes_for :backgrounds, allow_destroy: true
  has_many :qualifications, dependent: :destroy
  accepts_nested_attributes_for :qualifications, allow_destroy: true

  def initialize(args={})
    defaults = {firstname: "", lastname: "", nickname: ""}
    super defaults.merge(args)
  end

  def fullname(position=:lf)
    case position
    when :lf
      "#{self.lastname} #{self.firstname}"
    when :fl
      "#{self.firstname} #{self.lastname}"
    else
      "#{self.lastname} #{self.firstname}"
    end
  end
end
