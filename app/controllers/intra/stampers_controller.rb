class Intra::StampersController < Intra::ApplicationController
  def show
    @store = Store.first # Store.find(params[:store_id])
    @staffs = Staff.all
    @stamp = StampedEach.new
  end

  def create
    @stamp = StampedEach.new(stamp_params)
    @stamp.stamped_at = DateTime.current
    @stamp.ymd = @stamp.store.ymd
    daily = StampedDaily.where(ymd: @stamp.ymd, staff_id: @stamp.staff_id).first_or_create
    respond_to do |format|
      if daily.stamped_eaches << @stamp
        format.html { redirect_to intra_stamper_path, notice: 'stamped.' }
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
