class WelcomeController < ApplicationController

  #= Topページ
  # GET /welcome
  def index
    @carousels = Topic.carousels.limit(3)
    @topics = Topic.enables.limit(5)
  end

  #= Your Corpとは
  # GET /about_us
  def about_us
  end

  #= 私たちのビジョン
  # GET /mission
  def mission
  end

  #= 私たちのビジョン
  # GET /vision
  def vision
  end

  #= 保育理念
  # GET /policy/childcare
  def policy_childcare
  end
end
