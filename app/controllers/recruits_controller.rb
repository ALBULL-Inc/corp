class RecruitsController < ApplicationController
  before_action :add_breadcrumb_of_index
  before_action :set_recruit, only: [:show, :edit, :update, :destroy]

  # GET /recruits
  # GET /recruits.json
  def index
    @recruits = Recruit.enables
  end

  # GET /recruits/1
  # GET /recruits/1.json
  def show
    add_breadcrumb @recruit.title, recruit_url(@recruit)
  end

  private
    def set_recruit
      @recruit = Recruit.enables.find(params[:id])
    end

    def recruit_params
      params.require(:recruit).permit(:enable, :title, :job_content, :qualification, :compensation, :working_place)
    end

    def add_breadcrumb_of_index
      add_breadcrumb "採用情報", recruits_url
    end
end
