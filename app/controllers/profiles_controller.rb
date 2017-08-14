class ProfilesController < ApplicationController
  before_action :authenticate_account!
  before_action :set_profile

  def show
    add_breadcrumb "マイページ", profile_url
    @contacts = @profile.contacts
    @backgrounds = @profile.backgrounds.order(:background_type, :joined_on)
    @qualifications = @profile.qualifications
  end

  def edit
    add_breadcrumb "マイページ", profile_url
    add_breadcrumb "編集", edit_profile_url
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_profile
      @profile = current_account.profile
    end

    def profile_params
      params.require(:profile).permit(
        :nickname, :firstname, :lastname, :gender, :birthday,
        backgrounds_attributes: [:id, :background_type, :joined_on, :left_on, :site, :_destroy],
        qualifications_attributes: [:id, :issued_on, :title, :outline],
        contacts_attributes: [:id, :contact_type, :content]
      )
    end
end
