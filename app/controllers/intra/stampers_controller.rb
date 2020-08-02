class Intra::StampersController < Intra::ApplicationController
  skip_before_action :basic_auth, only: [:show, :create]

  def show
    @workplace = Workplace.where(organization: current_account.organizations).find(params[:workplace_id])
    @staffs = @workplace.staffs
    @dailies = {}
    StampedDaily.where(ymd: @workplace.ymd).each{|sd| @dailies[sd.staff_id] = sd}
    @stamp = StampedEach.new
  end

  def create
    if cd = params[:code]
      st = Staff.find_by(code: cd)
      params[:stamped_each][:staff_id] = st.id
    end
    @stamp = StampedEach.new(stamp_params)
    @stamp.stamped_at = DateTime.current
    @stamp.ymd = @stamp.workplace.ymd
    respond_to do |format|
      StampedEach.transaction do
        daily = StampedDaily.where(ymd: @stamp.ymd, staff_id: @stamp.staff_id).first_or_create
        if daily.stamped_eaches << @stamp
          format.html { redirect_to intra_workplace_stamper_path(@stamp.workplace_id), notice: @stamp.stamped_text }
          format.json { render :show, status: :created, location: intra_stamper_path }
        else
          format.html { render :show }
          format.json { render json: @stamp.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    def stamp_params
      params.require(:stamped_each).permit(:workplace_id, :staff_id, :stamped_type_id, :code)
    end
end
