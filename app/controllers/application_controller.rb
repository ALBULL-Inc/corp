# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  include Jpmobile::ViewSelector

  before_action :add_breadcrumb_of_root
  after_action  :store_location

  protect_from_forgery with: :exception

  protected
    def after_sign_in_path_for(resource_or_scope)
      if (session[:account_return_to] == root_path)
        return profile_path
      end
      session[:account_return_to] || root_path
    end

  private
    def add_breadcrumb_of_root
      #return if params[:controller] == 'welcome'
      return if request.path == '/'
      add_breadcrumb "#{view_context.fa_icon 'home'} Home", root_path
    end

    def store_location
      unless devise_controller?
        session[:account_return_to] = request.fullpath
      end
    end
end
