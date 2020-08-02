class PartiesController < ApplicationController
  layout "store"
  before_action :set_store
  before_action :set_party, only: [:show]
  before_action :add_breadcrumb_of_index

  # GET /parties
  # GET /parties.json
  def index
    @parties = @store.parties
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
    add_breadcrumb @party.name, store_parties_url(@store, @party)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find_by(pkey: params[:store_id])
    end

    def set_party
      @party = Party.find(params[:id])
    end

    def add_breadcrumb_of_index
      add_breadcrumb "店舗一覧", stores_url
      add_breadcrumb @store.name, store_url(@store.pkey)
      add_breadcrumb "パーティ", store_parties_url(@store.pkey)
    end
end
