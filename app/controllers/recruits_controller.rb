class RecruitsController < ApplicationController
  before_action :add_breadcrumb_of_index
  before_action :set_employment_type, only: [:index]
  before_action :set_recruit, only: [:show, :edit, :update, :destroy]

  # GET /recruits
  # GET /recruits.json
  def index
    @recruits = Recruit.enables
    if cond = recruit_condition.condition
      @recruits = @recruits.merge(cond)
    end
  end

  # GET /recruits/1
  # GET /recruits/1.json
  def show
    add_breadcrumb @recruit.title, recruit_url(@recruit)
  end

  private
    def recruit_condition
      @recruit_condition ||= RecruitCondition.new
    end
    def set_employment_type
      return unless params[:e_type]
      recruit_condition.employment_type = params[:e_type]
    end

    def set_recruit
      @recruit = Recruit.enables.find(params[:id])
    end

    def recruit_params
      params.require(:recruit).permit(:enable, :title, :job_content, :qualification, :compensation, :working_place)
    end

    def add_breadcrumb_of_index
      add_breadcrumb "求人情報", recruits_url
    end
end
