class TopicsController < ApplicationController
  before_action :add_breadcrumb_of_index
  before_action :set_topic, only: [:show]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.where(topicable: nil).enables.page(params[:page])
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    add_breadcrumb @topic.title, topic_url(@topic)
    @topics = Topic.where(topicable: nil).enables.limit(5)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.where(topicable: nil).find(params[:id])
    end

    def add_breadcrumb_of_index
      add_breadcrumb "トピックス", topics_url
    end
end
