class PhotosController < ApplicationController
  before_action :set_place

  def index
    @photos = @place.photos.page(params[:page]).per(15)
  end

  private
    def set_place
      @place = Place.where(key: params[:place_id]).first
    end
end
