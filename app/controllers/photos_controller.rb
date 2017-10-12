class PhotosController < ApplicationController
  layout "places"
  before_action :set_place
  before_action :current_family, only: [:index]

  def index
    if params[:ym].present?
      @month = @current_family.months.includes(:photos).find_by(ym: params[:ym])
      @photos = @month.photos.page(params[:page]).per(15)
    else
      @months = @current_family.months.page(params[:page]).per(9)
    end
  end

  private
    def set_place
      @place = Place.where(key: params[:place_id]).first
    end
end
