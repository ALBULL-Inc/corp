class DeviseExt::SessionsController < Devise::SessionsController
  before_action :add_breadcrumb_of_index

  private
    def add_breadcrumb_of_index
      add_breadcrumb "ログイン", new_account_session_url
    end
end
