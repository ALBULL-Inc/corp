class Intra::StampsController < Intra::ApplicationController
  def index
    @staff = Staff.find(params[:staff_id])
    @year, @month = [params[:year]&.to_i||Date.today.year,params[:month]&.to_i||Date.today.month]
    @monthly = StampedMonthly.new(@staff,@year,@month)
  end
end
