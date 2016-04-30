class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.enables
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topics = Topic.enables.limit(5)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end
end
