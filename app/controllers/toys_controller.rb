class ToysController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @toys = policy_scope(Toy)
    # start_date =
    #@toys.available(params[:start_date], params[:end_date])
    # date format: 2021-11-18
    today = DateTime.now.to_date
    #today.to_s # "2009-08-31"
    seven_days_from_now = (today + 7).to_date
    # Currently available: start date = today, end_date = day after tomorrow
    @available_toys = @toys.available(today, seven_days_from_now)
    # raise
  end

  def show
    #@toy = Toy.find(params[:id])
    set_toy
  end



  private
  def set_toy
    @toy = Toy.find(params[:id])
    authorize @toy
  end

end
