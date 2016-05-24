class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :constant
  before_action :add_breadcrumb_of_root

  private
    def constant
      @c_social ||= Rails.application.config_for("settings/social")
    end

    def add_breadcrumb_of_root
      return if params[:controller] == 'welcome'
      add_breadcrumb "#{view_context.glyph 'home'} Home", root_path
    end
end
