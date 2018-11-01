class RecruitsController < ApplicationController
  before_action :add_breadcrumb_of_index

  def index
  end

  def show
    add_breadcrumb @recruit.title, recruit_url(@recruit)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruit
      @recruit = Recruit.find(params[:id])
    end

    def add_breadcrumb_of_index
      add_breadcrumb "求人一覧", recruits_url
    end
end
