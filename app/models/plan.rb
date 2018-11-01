class Plan < ApplicationRecord
  # Association
  has_many :subscriptions

  # Scope
  default_scope ->{ order(:position) }

  # Callback
  after_create  :payjp_plan_create
  after_destroy :payjp_plan_delete


  private
    def payjp_plan_create
      pln = Payjp::Plan.create(
        name: self.title,
        amount: self.amount,
        currency: self.currency,
        interval: self.interval,
        trial_days: self.trial_days
      )
      self.update!(ser_id: pln.id)
      true
    end

    def payjp_plan_delete
      Payjp::Plan.retrieve(self.ser_id).delete
    end
end
