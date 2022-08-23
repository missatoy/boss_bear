class BookingsController < ApplicationController
  def create
    @booking = Booking.new
  end
end
