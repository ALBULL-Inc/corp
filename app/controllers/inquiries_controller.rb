class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])
    unless @inquiry.valid?
      render :new and return
    end
    @inquiry.send!
    redirect_to root_path, notice: "お問い合わせありがとうございます。ご返信まで少々お待ちください。"
  end
end
