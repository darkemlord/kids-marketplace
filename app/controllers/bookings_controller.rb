class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @toy = Toy.find(params[:toy_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.toy = Toy.find(params[:toy_id])
    @booking.user = current_user
    if @booking.save
      redirect_to root_path # we need to update this once we have the root for booking index
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      # render # where was the booking update form?
      render :index
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :delivery_option)
  end
end
