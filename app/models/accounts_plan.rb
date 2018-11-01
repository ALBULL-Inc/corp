class AccountsPlan < ApplicationRecord
  belongs_to :account
  belongs_to :plan
end
