class StoresController < ApplicationController
  before_action :add_breadcrumb_of_index
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    add_breadcrumb @store.name, store_url(@store)
    @menus = Menu.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    def add_breadcrumb_of_index
      add_breadcrumb "店舗一覧", stores_url
    end
end
