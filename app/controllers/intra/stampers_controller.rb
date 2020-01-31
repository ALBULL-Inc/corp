class Intra::StampersController < Intra::ApplicationController
  def show
    @store = Store.find(params[:store_id])
    @staffs = @store.organization.employees
    @dailies = {}
    StampedDaily.where(ymd: @store.ymd).each{|sd| @dailies[sd.staff_id] = sd}
    @stamp = StampedEach.new
  end

  def create
    @stamp = StampedEach.new(stamp_params)
    @stamp.stamped_at = DateTime.current
    @stamp.ymd = @stamp.store.ymd
    daily = StampedDaily.where(ymd: @stamp.ymd, staff_id: @stamp.staff_id).first_or_create
    respond_to do |format|
      if daily.stamped_eaches << @stamp
        format.html { redirect_to intra_store_stamper_path(@stamp.store_id), notice: @stamp.stamped_text }
        format.json { render :show, status: :created, location: intra_stamper_path }
      else
        format.html { render :show }
        format.json { render json: @stamp.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def stamp_params
      params.require(:stamped_each).permit(:store_id, :staff_id, :stamped_type_id)
    end
end
