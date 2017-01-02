class ApplicationController < ActionController::Base
  include Jpmobile::ViewSelector

  before_action :add_breadcrumb_of_root

  protect_from_forgery with: :exception

  private
    def add_breadcrumb_of_root
      return if params[:controller] == 'welcome'
      add_breadcrumb "#{view_context.glyph 'home'} Home", root_path
    end
end
