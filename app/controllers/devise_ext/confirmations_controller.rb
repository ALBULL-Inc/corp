class DeviseExt::ConfirmationsController < Devise::ConfirmationsController
  before_action :add_breadcrumb_of_index

  private
    def add_breadcrumb_of_index
      add_breadcrumb "確認メールの再送信", new_account_confirmation_url
    end
end
