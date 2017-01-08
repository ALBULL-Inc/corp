class Qualification < ApplicationRecord
  belongs_to :profile

  validates :issued_on, presence: true
end
