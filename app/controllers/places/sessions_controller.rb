class Places::SessionsController < ApplicationController
  before_action :set_place
  before_action :add_breadcrumb_of_place

  def new
  end

  def create
    family = Family.find_code(params[:code])
    unless @place.allow?(family)
      flash[:alert] = "ログイン出来ませんでした。CODEもしくは施設を確認してください。"
      render :new and return
    end
    place_sign_in(family)
    redirect_to @place
  end

  def destroy
    cookies.delete(:family_remember_token)
    @current_family
    redirect_to @place
  end

  private
  def set_place
    @place = Place.where(key: params[:place_id]).first
  end

  def place_sign_in(family)
    # 複数ログイン対応
    # remember_token = SecureRandom.urlsafe_base64
    remember_token = family.remember_token || SecureRandom.urlsafe_base64
    cookies.permanent[:family_remember_token] = remember_token
    # 複数ログイン対応
    # enc_token = Digest::SHA256.hexdigest(remember_token.to_s)
    enc_token = remember_token.to_s
    family.update!(remember_token: enc_token)
    @current_family = family
  end

  def add_breadcrumb_of_place
    add_breadcrumb @place.name, place_url(@place)
  end
end
