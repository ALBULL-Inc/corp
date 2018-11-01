class Subscription < ApplicationRecord
  belongs_to :account
  belongs_to :plan
  has_many :subscription_logs

  delegate :amount, :currency, to: :plan

  before_destroy :payjp_subscription_delete

  def active?
    self.status == 10
  end

  private
    def payjp_subscription_delete
      Payjp::Subscription.retrieve(self.sub_id).delete
    end
end
