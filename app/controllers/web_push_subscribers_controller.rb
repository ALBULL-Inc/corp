# -*- encoding : utf-8 -*-
class WebPushSubscribersController < ApplicationController

  # POST /web_push_subscribers
  # POST /web_push_subscribers.json
  def create
    @subscriber = WebPushSubscriber.new(subscriber_params)
    @subscriber.active = true

    respond_to do |format|
      @subscriber.save
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      params.require(:subscriber).permit(
        :id, :type, :account_id, :registration_key, :active
      )
    end
end
