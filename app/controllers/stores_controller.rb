class StoresController < ApplicationController
  before_action :add_breadcrumb_of_index
  before_action :set_store, only: [:show]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.enables
    #redirect_to @stores.first if @stores.count == 1
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    add_breadcrumb @store.name, store_url(@store)
    @menus = @store.stores_menus.includes(:menu)
    render layout: 'store'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find_by(pkey: params[:id])
    end

    def add_breadcrumb_of_index
      add_breadcrumb "店舗情報", stores_url
    end
end
