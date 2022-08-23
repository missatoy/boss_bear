class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @bear = Bear.find(params[:bear_id])
    @booking.bear=@bear
    if @booking.save
      redirect_to bears_path
    else
      render "new"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_finish)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path(@booking.profile)
  end
end
