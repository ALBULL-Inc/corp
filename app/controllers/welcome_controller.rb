class WelcomeController < ApplicationController

  #= Topページ
  # GET /welcome
  def index
    @carousels = Topic.carousels.limit(3)
    @topics = Topic.enables.limit(5)
  end

  #= 会社概要
  # GET /about_us
  def about_us
    add_breadcrumb "会社概要", about_us_url
  end

  #= 企業理念
  # GET /mission
  def mission
    add_breadcrumb "企業理念", mission_url
  end

  #= 保育理念
  # GET /policy/childcare
  def policy_childcare
    add_breadcrumb "保育理念", policy_childcare_url
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
