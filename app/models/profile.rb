class Profile < ApplicationRecord
  belongs_to :account

  validates :nickname, presence: true, on: :update

  def initialize(args={})
    defaults = {firstname: "", lastname: "", nickname: ""}
    super defaults.merge(args)
  end

  def enough?
    [self.firstname,self.lastname,self.gender].all?{|v| v.present?}
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
