class PhotosController < ApplicationController
  layout "places"
  before_action :set_place
  before_action :current_family, only: [:index]

  def index
    redirect_to @place and return unless @place.allow?(@current_family)
    target = @current_family.usage_months.where(usage_records: {place: @place}).includes(:photos)
    if params[:ym].present?
      @month = Month.find_by(ym: params[:ym])
      redirect_to @place and return unless @current_family.usage_records.by_place(@place).by_month(@month).exists?
      @photos = @place.photos.joins(:month).where(months: {ym: @month.ym}).page(params[:page]).per(15)
    else
      @months = Month.where(id: @current_family.usage_records.by_place(@place).pluck(:month_id)).page(params[:page]).per(9)
    end
  end

  private
    def set_place
      @place = Place.where(key: params[:place_id]).first
    end
end
