class PlacesController < ApplicationController
  before_action :set_place, only: [:show]

  def index
    @places = Place.all
  end

  def show
  end

  private
    def set_place
      @place = Place.where(key: params[:id]).first
    end
end
