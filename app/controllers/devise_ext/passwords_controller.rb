class DeviseExt::PasswordsController < Devise::PasswordsController
  before_action :add_breadcrumb_of_index

  private
    def add_breadcrumb_of_index
      add_breadcrumb "パスワードの再設定", new_account_password_url
    end
end
