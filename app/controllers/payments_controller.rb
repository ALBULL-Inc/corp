class PaymentsController < ApplicationController
  def subscription
    cus_id = current_account.cus_id
    cus_id = current_account.payjp_customer_create.cus_id if cus_id.blank?

    pay = current_account.subscriptions.new(payment_params)
    pay.token = params['payjp-token']

    tok = Payjp::Token.retrieve(pay.token)
    input_card = tok.card

    customer = Payjp::Customer.retrieve(cus_id)

    has_cards = customer.cards.map{|c| [c.fingerprint, c.exp_year, c.exp_month] }
    already = has_cards.detect{|c| c == [input_card.fingerprint, input_card.exp_year, input_card.exp_month]}
    unless already
      customer.card = pay.token
      customer.save
    end

    subscription = Payjp::Subscription.create(
      plan:     pay.payable.ser_id,
      customer: cus_id
    )
    pay.pay_id       = subscription.id
    pay.period_start = Time.at(subscription.current_period_start)
    pay.period_end   = Time.at(subscription.current_period_end)
    pay.status       = subscription.status == "active" ? 10 : 0
    pay.currency     = pay.payable.currency
    pay.data         = subscription.to_json
    pay.save
    redirect_to profile_path
  end

  def pause
    sub = current_account.subscriptions.find(params[:id])
    subscription = Payjp::Subscription.retrieve(sub.pay_id)
    subsc = subscription.pause
    pp subsc
    sub.status       = subsc.status == "active" ? 10 : 0
    sub.save
    redirect_to profile_path
  end

  def charge
    pay = Charge.new(payment_params)
    pay.token = params['payjp-token']

    charge = Payjp::Charge.create(
      amount: pay.payable.amount,
      card: pay.token,
      currency: pay.payable.currency || 'jpy'
    )
    pay.save
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:payable_type, :payable_id)
    end
end
