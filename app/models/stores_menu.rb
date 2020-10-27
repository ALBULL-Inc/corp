class StoresMenu < ApplicationRecord
  belongs_to :menu
  belongs_to :store
  delegate :name, :content, to: :menu

  def price
    @price ||= "#{self.amount.to_s(:delimited)}円"
  end
end
