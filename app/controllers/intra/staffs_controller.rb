class Intra::StaffsController < Intra::ApplicationController
  before_action :set_organization, except: [:index]
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  # GET /staffs
  # GET /staffs.json
  def index
    @organization = Organization.find(params[:organization_id]) if params[:organization_id]
    @store = Store.find(params[:store_id]) if params[:store_id]
    @staffs = (@organization || @store).staffs.order(code: :asc).page(params[:page]).per(50)
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @stores = @organization.stores
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
    @stores = @organization.stores
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)
    respond_to do |format|
      if @organization.employees << @staff
        format.html { redirect_to [:intra,@organization], notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to [:intra,@organization], notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to cms_staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:code, :last_name, :first_name, :last_kana, :first_kana,
                                   stores_staffs_attributes: [:id, :store_id, :_destroy])
    end
end
