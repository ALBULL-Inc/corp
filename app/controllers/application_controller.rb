class ApplicationController < ActionController::Base
  include Jpmobile::ViewSelector

  before_action :constant
  before_action :add_breadcrumb_of_root

  protect_from_forgery with: :exception

  private
    def constant
      @c_social ||= Rails.application.config_for("settings/social")
    end

    def add_breadcrumb_of_root
      return if params[:controller] == 'welcome'
      add_breadcrumb "#{view_context.glyph 'home'} Home", root_path
    end
end
