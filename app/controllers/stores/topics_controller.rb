class Stores::TopicsController < ApplicationController
  before_action :set_store
  before_action :add_breadcrumb_of_index
  before_action :set_topic, only: [:show]
  layout "store"

  # GET /topics
  # GET /topics.json
  def index
    @topics = @store.topics.enables.page(params[:page])
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    add_breadcrumb @topic.title, topic_url(@topic)
    @topics = @store.topics.enables.limit(5)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find_by(pkey: params[:store_id])
    end
    def set_topic
      @topic = @store.topics.find(params[:id])
    end

    def add_breadcrumb_of_index
      add_breadcrumb "店舗情報", stores_url
      add_breadcrumb @store.name, store_url(@store.pkey)
      add_breadcrumb "トピックス", store_topics_url(@store.pkey)
    end
end
