class Intra::StampsController < Intra::ApplicationController
  before_action :set_organization, only: [:index, :show, :new, :create]

  def index
    @staff = @organization.employees.find_by(code: params[:staff_id])
    @year, @month = [params[:year]&.to_i||Date.today.year,params[:month]&.to_i||Date.today.month]
    @monthly = StampedMonthly.new(@staff,@year,@month)
  end

  def show
    @staff = @organization.employees.find_by(code: params[:staff_id])
    @daily = @staff.stamped_dailies.where(ymd: params[:ymd]).first_or_initialize
  end

  def new
  end

  def create
    pp params
    pp f = params[:csv_file]

    require 'csv'
    staff_ids = {}
    eaches = []
    CSV.foreach(f.path, headers: 1) do |row|
      no = row[0]
      day = row[4]
      time = row[5]
      dt = DateTime.parse("#{day} #{time} +0900")
      type = row[6] == "出勤" ? StampedType::WORKING_START : StampedType::WORKING_END

      staff_ids[no] ||= Staff.find_by(code: no).id rescue next


      #if dt.ymd >= 20200101
      if dt.ymd >= 20191201
        eaches << StampedEach.new(store_id: store.id, staff_id: staff_ids[no], stamped_type_id: type, stamped_at: dt, ymd: store.ymd(dt))
      end
    end
    p eaches.size

    begin
      eaches.each do |e|
        daily = StampedDaily.where(ymd: e.ymd, staff_id: e.staff_id).first_or_create
        daily.stamped_eaches << e unless dry_run
        p e
      end
      # StampedDailyをsave
    rescue => e
      Rails.logger.fatal e
      #notifier.ping "<!channel> :scream: lib/tasks/import_mf.rake でエラーが発生しました。"
    end
    redirect_to intra_root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:organization_id])
    end
end
