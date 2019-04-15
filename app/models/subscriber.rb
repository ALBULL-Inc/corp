class Subscriber < ApplicationRecord
  validates :registration_key, presence: true
  belongs_to :account
end
