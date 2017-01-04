class ProfilesController < ApplicationController
  before_action :authenticate_account!
  before_action :set_profile

  def show
  end

  def edit
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
      params.require(:profile).permit(:nickname, :firstname, :lastname, :gender, :birthday)
    end
end
