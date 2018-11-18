class WelcomeController < ApplicationController

  #= Topページ
  # GET /welcome
  def index
    @topics = Topic.enables
    @stores = Store.enables
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

  #= 特定商取引法に基づく表記
  # GET /law
  def law
    add_breadcrumb "特定商取引法に基づく表記", law_url
  end
end
