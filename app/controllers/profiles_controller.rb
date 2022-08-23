class ProfilesController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
