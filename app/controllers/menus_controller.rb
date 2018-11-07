class MenusController < ApplicationController
  before_action :set_menu, only: [:show]

  def show
    add_breadcrumb "メニュー", menu_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end
end
