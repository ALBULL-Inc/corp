class Intra::ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :exception
  layout 'intra'
  before_action :basic_auth, if: :use_basic_auth?

  private
    def basic_auth
      http_basic_authenticate_with \
        name: Settings.basic.cms.name, password: Settings.basic.cms.password
    end

    def use_basic_auth?
      !%w{development test}.include?(Rails.env)
    end
end
