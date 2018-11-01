class Menu < ApplicationRecord

  def price
    @price ||= "#{self.amount}円"
  end
end
