class PlacesController < ApplicationController
  layout "application", only: [:index]
  before_action :set_place, only: [:show]

  def index
    add_breadcrumb "運営施設一覧", profile_url
    @places = Place.all
  end

  def show
  end

  private
    def set_place
      @place = Place.where(key: params[:id]).first
    end
end
