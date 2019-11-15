class Intra::StampsController < Intra::ApplicationController
  def index
    #@staff = Staff.find(params[:staff_id])
    @staff = Staff.first
    @year, @month = [params[:year]||Date.today.year,params[:month]||Date.today.month]
    @monthly = StampedMonthly.new(@staff,@year,@month)
  end
end
