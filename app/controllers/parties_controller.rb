class PartiesController < ApplicationController
  before_action :add_breadcrumb_of_index
  before_action :set_party, only: [:show]

  # GET /parties
  # GET /parties.json
  def index
    @parties = Party.all
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
    add_breadcrumb @party.name, parties_url(@party)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    def add_breadcrumb_of_index
      add_breadcrumb "パーティ", parties_url
    end
end
