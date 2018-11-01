class SubscriptionsController < ApplicationController
  before_action :authenticate_account!

  def create
    plan = Plan.find(params[:plan_id])

    # すでにレコードが存在する場合は再開になる
    redirect_to profile_path and return \
      if Subscription.where(account: current_account, plan: plan).exists?


    cus_id = current_account.cus_id
    payjp_customer = Payjp::Customer.retrieve(cus_id)

    s = current_account.build_subscription(plan: plan, token: params['payjp-token'])
    log = s.subscription_logs.build
    payjp_customer.card = s.token
    begin
      payjp_customer.save
    rescue => e
      Rails.logger.warn(e.http_status)
      Rails.logger.warn(e.message)
      Rails.logger.warn(e.to_s)
    end

    payjp_subscription = Payjp::Subscription.create(
      plan:     plan.ser_id,
      customer: cus_id
    )
    log.response   = payjp_subscription.to_json
    log.save
    s.sub_id       = payjp_subscription.id
    s.period_start = Time.at(payjp_subscription.current_period_start)
    s.period_end   = Time.at(payjp_subscription.current_period_end)
    s.status       = payjp_subscription.status == "active" ? 10 : 0
    s.save
    redirect_to profile_path
  end

  def pause
    s = Subscription.where(account: current_account).find(params[:id])
    subscription = Payjp::Subscription.retrieve(s.sub_id)
    res = subscription.pause
    s.subscription_logs.build(response: res).save
    s.status = res.status == "active" ? 10 : 0
    s.save
    redirect_to profile_path
  end

  def resume
    s = Subscription.where(account: current_account).find(params[:id])
    subscription = Payjp::Subscription.retrieve(s.sub_id)
    res = subscription.resume
    s.subscription_logs.build(response: res).save
    s.status = res.status == "active" ? 10 : 0
    s.save
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
    def subscription_params
      params.require(:subscription).permit(:payable_type, :payable_id)
    end
end
