class Intra::StampsController < Intra::ApplicationController
  def index
    @store = Store.find(params[:store_id]) rescue nil
    @store ||= Store.first #fixme 店舗ごとでできるようになったら消す
    @staffs = Staff.includes(:stamped_dailies)
  end
end
