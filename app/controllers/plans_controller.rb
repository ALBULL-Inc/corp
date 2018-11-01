class PlansController < ApplicationController
  before_action :add_breadcrumb_of_index
  before_action :set_plan, only: [:show]

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    add_breadcrumb @plan.title, plan_url(@plan)
    @subscription = @plan.subscriptions.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    def add_breadcrumb_of_index
      add_breadcrumb "月額プラン", plans_url
    end
end
