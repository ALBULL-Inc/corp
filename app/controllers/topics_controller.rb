class TopicsController < ApplicationController
  before_action :add_breadcrumb_of_index
  before_action :set_topic, only: [:show]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.enables.page(params[:page])
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    add_breadcrumb @topic.title, topic_url(@topic)
    @topics = Topic.enables.limit(5)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def add_breadcrumb_of_index
      add_breadcrumb "トピックス", root_url
    end
end
