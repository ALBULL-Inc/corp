class PhotosController < ApplicationController
  layout "places"
  before_action :set_place
  before_action :current_family, only: [:index]

  def index
    redirect_to @place and return unless @place.allow?(@current_family)
    c_t  = Child.arel_table
    m_t  = Month.arel_table
    p_t  = Photo.arel_table
    pl_t = Place.arel_table
    ur_t = UsageRecord.arel_table
    mp_t = MonthsPhoto.arel_table
    pp_t = PlacesPhoto.arel_table

    has_photos_months = MonthsPhoto.where(mp_t[:month_id].eq(m_t[:id]))
    has_photos_places = Place.joins(:places_photos).where(pl_t[:id].eq(@place.id)).reorder(nil)

    usage = UsageRecord.joins(:child).\
      where(has_photos_places.exists).\
      where(m_t[:id].eq(ur_t[:month_id])).\
      where(c_t[:family_id].eq(@current_family.id).and(ur_t[:place_id].eq(@place.id)))

    month = Month.where(has_photos_months.exists).where(usage.exists)

    if params[:ym].present?
      @month = month.find_by(ym: params[:ym])
      redirect_to @place and return unless @month
      ppt_cond = PlacesPhoto.where(
        p_t[:id].eq(pp_t[:photo_id]).and(pp_t[:place_id].eq(@place.id))
      )
      mpt_cond = MonthsPhoto.where(
        p_t[:id].eq(mp_t[:photo_id]).and(mp_t[:month_id].eq(@month.id))
      )
      @photos = Photo.where(ppt_cond.exists).where(mpt_cond.exists).\
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
