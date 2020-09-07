class Intra::StampedEachesController < Intra::ApplicationController
  before_action :set_organization, only: [:new, :edit, :create, :update]

  def new
    @stamped_each = StampedEach.new
    @staffs = @organization.employees
    @workplaces = @organization.workplaces
  end

  def edit
    @stamped_each = StampedEach.find(params[:id])
  end

  def create
    @stamped_each = StampedEach.new(stamped_each_params)
    @stamped_each.ymd = @stamped_each.workplace.ymd(@stamped_each.stamped_at)

    respond_to do |format|
      StampedEach.transaction do
        daily = StampedDaily.where(ymd: @stamped_each.ymd, staff_id: @stamped_each.staff_id).first_or_create
        if daily.stamped_eaches << @stamped_each
          format.html { redirect_to [:intra,@organization, @stamped_each.staff, :stamps], notice: 'StampedEach was successfully created.' }
          format.json { render :show, status: :created, location: @stamped_each }
        else
          format.html { render :new }
          format.json { render json: @stamped_each.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    @stamped_each = StampedEach.find(params[:id])

    respond_to do |format|
      if @stamped_each.update(stamped_each_params)
        format.html { redirect_to [:intra,@organization, @stamped_each.staff, :stamps], notice: 'StampedEach was successfully updated.' }
        format.json { render :show, status: :created, location: @stamped_each }
      else
        format.html { render :new }
        format.json { render json: @stamped_each.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    def stamped_each_params
      params.require(:stamped_each).permit( :staff_id, :workplace_id, :stamped_type_id, :stamped_at )
    end
end
