class Profile < ApplicationRecord
  belongs_to :account

  def initialize(args={})
    defaults = {firstname: "", lastname: "", nickname: ""}
    super defaults.merge(args)
  end
end
