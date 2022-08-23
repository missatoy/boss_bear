class BookingsController < ApplicationController
  def create
    @booking = Booking.new
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path(@booking.profile)
  end
end
