class DeviseExt::RegistrationsController < Devise::RegistrationsController
  before_action :add_breadcrumb_of_index

  private
    def add_breadcrumb_of_index
      add_breadcrumb "会員登録", new_account_registration_url
    end
end
