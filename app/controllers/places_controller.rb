class PlacesController < ApplicationController
  layout "application", only: [:index]
  before_action :set_place, only: [:show]
  before_action :current_family, only: [:show]

  def index
    add_breadcrumb "運営施設一覧", places_url
    @places = Place.enables
  end

  def show
    add_breadcrumb @place.name, place_url(@place)
    @parent_mode = @place.allow?(@current_family)
  end

  private
    def set_place
      @place = Place.where(key: params[:id]).first
    end
end
