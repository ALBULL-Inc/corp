class PhotosController < ApplicationController
  layout "places"
  before_action :set_place
  before_action :current_family, only: [:index]

  def index
    redirect_to @place and return unless @place.allow?(@current_family)
    m_t  = Month.arel_table
    c_t  = Child.arel_table
    p_t  = Photo.arel_table
    mp_t = MonthsPhoto.arel_table
    pp_t = PlacesPhoto.arel_table
    ur_t = UsageRecord.arel_table
    photos = Photo.joins(:months_photo).where(m_t[:id].eq(mp_t[:month_id]))
    usages = UsageRecord.joins(:child). \
      where(m_t[:id].eq(ur_t[:month_id])). \
      where(c_t[:family_id].eq(@current_family.id))
    month = Month.where(photos.exists).where(usages.exists)
    if params[:ym].present?
      @month = month.find_by(ym: params[:ym])
      redirect_to @place and return unless @month
      ppt_cond = PlacesPhoto.where(
        p_t[:id].eq(pp_t[:photo_id]).and(pp_t[:place_id].eq(@place.id))
      )
      mpt_cond = MonthsPhoto.where(
        p_t[:id].eq(mp_t[:photo_id]).and(mp_t[:month_id].eq(@month.id))
      )
      @photos = Photo.where(ppt_cond.exists).where(mpt_cond.exists). |
        page(params[:page]).per(15)
    else
      @months = month.page(params[:page]).per(9)
    end
  end

  private
    def set_place
      @place = Place.where(key: params[:place_id]).first
    end
end
