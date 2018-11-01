class MenusController < ApplicationController
  def show
    add_breadcrumb "メニュー", menu_path
  end
end
