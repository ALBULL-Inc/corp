class WelcomeController < ApplicationController

  #= Topページ
  # GET /welcome
  def index
    @topics = Topic.all
    @stores = Store.all
  end

  #= プライバシーポリシー
  # GET /policy/privacy
  def policy_privacy
    add_breadcrumb "プライバシーポリシー", policy_privacy_url
  end

  #= 利用規約
  # GET /terms
  def terms
    add_breadcrumb "利用規約", terms_url
  end
end
