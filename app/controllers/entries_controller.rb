class EntriesController < ApplicationController
  before_action :authenticate_account!
  before_action :fill_in_profile!
  before_action :set_recruit

  def new
    add_breadcrumb @recruit.title, recruit_url(@recruit)
    add_breadcrumb "エントリー", new_recruit_entry_url(@recruit)
    @entry = current_account.entries.build(recruit: @recruit)
  end

  def create
    @entry = current_account.entries.build(entry_params.merge(recruit: @recruit))

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry.recruit, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry.recruit }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def fill_in_profile!
      unless current_account.profile.enough?
        redirect_to edit_profile_url, notice: "応募するにはプロフィールを充足させてください"  and return
      end
    end

    def set_recruit
      @recruit = Recruit.find(params[:recruit_id])
    end

    def entry_params
      params.require(:entry).permit(:comment)
    end
end
