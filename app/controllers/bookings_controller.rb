class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new booking_params
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking.id)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find params[:id]
  end

  def edit
  end

  def update
    if @booking.update booking_params
      redirect_to booking_path(@booking.id)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy redirect_to booking_path
  end

  private

  def booking_params
    params.require(:booking).permit(:payment_info, :start_date, :end_date)
  end
end
