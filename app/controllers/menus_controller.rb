class MenusController < ApplicationController
  before_action :set_menu, only: [:show]

  def show
    add_breadcrumb @menu.name, menu_path(@menu)
    @stores_menus = StoresMenu.includes(:store).where(menu: @menu).all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end
end
