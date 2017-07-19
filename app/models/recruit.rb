class Recruit < ApplicationRecord
  default_scope ->{ order(position: :desc) }
  scope :enables, ->{ where(arel_table[:enable].eq(true)) }

  has_many :entries

  def application?(account)
    Entry.where(account: account, recruit: self).exists?
  end
end
