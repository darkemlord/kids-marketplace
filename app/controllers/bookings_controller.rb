class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking).order(start_date: :desc) # as a renter
    @bookings_as_owner = current_user.bookings_as_owner.order(start_date: :desc)
  end

  def new
    @toy = Toy.find(params[:toy_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    #puts "*****************" + @booking.start_date
    #raise
    @booking.toy = Toy.find(params[:toy_id])
    @booking.user = current_user

    authorize @booking
    if @booking.save
      redirect_to bookings_path # we need to update this once we have the root for booking index
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      # render # where was the booking update form?
      render :index
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :delivery_option, :approval_status)
  end
end
