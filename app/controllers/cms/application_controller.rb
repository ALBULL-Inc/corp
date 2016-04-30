class Cms::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'cms'
#  http_basic_authenticate_with \
#    name: Settings.basic.cms.name, password: Settings.basic.cms.password \
#    unless %w{development test}.include?(Rails.env)

  def index
    render 'cms/index'
  end
end
