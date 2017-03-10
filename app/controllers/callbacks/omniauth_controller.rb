# -*- encoding : utf-8 -*-
class Callbacks::OmniauthController < ApplicationController

  def facebook
    provider_common
  end

  def google
    provider_common
  end

  def line
    provider_common
  end

  def failure
    redirect_to new_account_session_path
  end

  private
    def provider_common
      info = (auth = request.env["omniauth.auth"]).try(:info)
      redirect_to root_path and return unless info
      oauth = AccountOAuth.find_or_initialize_by(provider: auth.provider, uid: auth.uid)
      if oauth.new_record?
        if auth.provider.eql?('line') && !account_signed_in?
          msg = 'このLINEアカウントは登録されていないためログイン出来ません。' \
            '他の方法でログイン後マイページよりLINEの紐付けを行ってください。'
          redirect_to new_account_session_path, notice: msg and return
        end
        oauth.email  = info.email
        oauth.avatar = info.image
        oauth.data   = auth.to_json

        account = account_signed_in? ? current_account : nil
        account ||= info.email.present? ? Account.find_by_email(info.email) : nil
        oauth.account_id = account.id if account
        unless account
          raw_info = auth[:extra][:raw_info]
          account = oauth.build_account(email: info.email, password: Devise.friendly_token[0,32], email_require: false)
          account.build_profile(
            nickname: info[:nickname] || info[:name],
            firstname: info[:first_name], lastname: info[:last_name],
            gender: raw_info[:gender] ? (raw_info[:gender] == "male" ? Gender::MALE : Gender::FEMALE) : 0
          )
          account.skip_confirmation!
        end
      end
      oauth.access_token = auth["credentials"].try(:[], "token")
      oauth.save
      sign_in_and_redirect oauth.account, event: :authentication
    end
end
