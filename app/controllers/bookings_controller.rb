class BookingsController < ApplicationController
    before_action :authorize_user!, only: [:destroy, :edit, :update] 
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

  def index
    # @my_booking = Booking.where(user_id: current_user.id)
    # @bookers
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

  def authorize_user!
    redirect_to root_path, alert: 'Access Denied!' unless can? :crud, @booking
  end
end