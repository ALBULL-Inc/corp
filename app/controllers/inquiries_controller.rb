class InquiriesController < ApplicationController

  def new
    add_breadcrumb "お問合せ", new_inquiry_url
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    unless @inquiry.valid?
      render :new and return
    end
    @inquiry.send!(current_account)
    redirect_to root_path, notice: "お問い合わせありがとうございます。ご返信まで少々お待ちください。"
  end

  private
    def inquiry_params
      params.require(:inquiry).permit(:email, :name, :title, :body)
    end
end
