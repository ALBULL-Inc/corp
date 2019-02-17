class DartsliveCardsController < ApplicationController
  before_action :add_breadcrumb_of_index
  before_action :set_dartslive_card, only: [:edit, :update, :destroy]

  # GET /dartslive_cards/new
  def new
    @dartslive_card = current_account.dartslive_cards.build
  end

  # GET /dartslive_cards/1/edit
  def edit
  end

  # POST /dartslive_cards
  # POST /dartslive_cards.json
  def create
    @dartslive_card = current_account.dartslive_cards.build(dartslive_card_params)

    respond_to do |format|
      if @dartslive_card.save
        format.html { redirect_to profile_url, notice: 'DartsliveCard was successfully created.' }
        format.json { render :show, status: :created, location: profile_url }
      else
        format.html { render :new }
        format.json { render json: @dartslive_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dartslive_cards/1
  # PATCH/PUT /dartslive_cards/1.json
  def update
    respond_to do |format|
      if @dartslive_card.update(dartslive_card_params)
        format.html { redirect_to profile_url, notice: 'DartsliveCard was successfully updated.' }
        format.json { render :show, status: :ok, location: profile_url }
      else
        format.html { render :edit }
        format.json { render json: @dartslive_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dartslive_cards/1
  # DELETE /dartslive_cards/1.json
  def destroy
    @dartslive_card.destroy
    respond_to do |format|
      format.html { redirect_to profile_url, notice: 'DartsliveCard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dartslive_card
      @dartslive_card = current_account.dartslive_cards.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dartslive_card_params
      params.require(:dartslive_card).permit(:no, :name, :password)
    end

    def add_breadcrumb_of_index
      add_breadcrumb "プロフィール", profile_url
    end
end
