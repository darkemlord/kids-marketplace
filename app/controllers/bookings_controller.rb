class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    raise
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.toy = @toy
    if @booking.save
      redirect_to toy_path(@toy)
    else
      render :new
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :delivery_option, :user_id, :toy_id)
  end

end
