class Cms::UsageRecordsController < Cms::ApplicationController
  before_action :set_usage_record, only: [:show, :edit, :update, :destroy]

  # GET /cms/usage_records
  # GET /cms/usage_records.json
  def index
    if params[:ym]
      @month = Month.find_by(ym: params[:ym])
      @usage_records = @month&.usage_records || []
    else
      @usage_records = UsageRecord.order(month_id: :desc, place_id: :asc).all
    end
  end

  # GET /cms/usage_records/1
  # GET /cms/usage_records/1.json
  def show
  end

  # GET /cms/usage_records/new
  def new
    @usage_record = UsageRecord.new
    @children = Child.all
  end

  # GET /cms/usage_records/1/edit
  def edit
    @children = Child.all
  end

  # POST /cms/usage_records
  # POST /cms/usage_records.json
  def create
    place = Place.find(usage_record_params[:place_id])
    month = Month.find(usage_record_params[:month_id])
    usage_record_params[:child_id].each do |cid|
      child = Child.find(cid)
      child.used!(place, month)
    end

    respond_to do |format|
      format.html { redirect_to cms_usage_records_url, notice: 'Usage record was successfully created.' }
      format.json { render :show, status: :created, location: @usage_record }
    end
  end

  # PATCH/PUT /cms/usage_records/1
  # PATCH/PUT /cms/usage_records/1.json
  def update
    place = Place.find(usage_record_params[:place_id])
    month = Month.find(usage_record_params[:month_id])
    usage_record_params[:child_id].each do |cid|
      child = Child.find(cid)
      child.used!(place, month)
    end
    respond_to do |format|
      format.html { redirect_to cms_usage_records_url, notice: 'Usage record was successfully updated.' }
      format.json { render :show, status: :ok, location: @usage_record }
    end
  end

  # DELETE /cms/usage_records/1
  # DELETE /cms/usage_records/1.json
  def destroy
    @usage_record.destroy
    respond_to do |format|
      format.html { redirect_to cms_usage_records_url, notice: 'Usage record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usage_record
      @usage_record = UsageRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usage_record_params
      params.require(:usage_record).permit(:month_id, :place_id, child_id: [])
    end
end
