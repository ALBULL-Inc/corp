class Intra::ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :exception
  layout 'intra'

  http_basic_authenticate_with \
    name: Settings.basic.cms.name, password: Settings.basic.cms.password \
    unless %w{development test}.include?(Rails.env)
end
