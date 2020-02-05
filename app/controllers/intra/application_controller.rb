class Intra::ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :exception
  layout 'intra'
  before_action :basic_auth, if: :use_basic_auth?

  private
    def basic_auth
      authenticate_or_request_with_http_basic("Application") do |name, password|
        name == Settings.basic.cms.name && password == Settings.basic.cms.password
      end
    end

    def use_basic_auth?
      !%w{development test}.include?(Rails.env)
    end
end
