class Intra::StaffsController < Intra::ApplicationController
  before_action :authenticate_account!
  before_action :set_organization, except: [:index]
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  # GET /staffs
  # GET /staffs.json
  def index
    @workplace = Workplace.where(organization: current_account.organizations).find(params[:workplace_id])
    @staffs = @workplace.staffs.joins(:current_contract).order(code: :asc).page(params[:page]).per(50)
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
    @staff.build_current_contract
    @workplaces = @organization.workplaces
    @employment_types = EmploymentType::WORDS.map{|w| [w.first, I18n.t(w.last)]}
  end

  # GET /staffs/1/edit
  def edit
    @workplaces = @organization.workplaces
    @employment_types = EmploymentType::WORDS.map{|w| [w.first, I18n.t(w.last)]}
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = @organization.employees.build(staff_params)
    @staff.current_contract.organization_id = @organization.id
    respond_to do |format|
      if @staff.save
        format.html { redirect_to [:intra,@organization], notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        @workplaces = @organization.workplaces
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
      @organization = current_account.organizations.find(params[:organization_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find_by(code: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(
        :code, :last_name, :first_name, :last_kana, :first_kana,
        current_contract_attributes: [:id, :workplace_id, :employment_type, :effective_on, :expiration_on])
    end
end
