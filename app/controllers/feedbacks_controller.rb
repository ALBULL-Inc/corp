# -*- encoding : utf-8 -*-
class FeedbacksController < ApplicationController

  # POST /feedbacks
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      @feedback.save
      format.js { render nothing: true }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:content)
    end
end
