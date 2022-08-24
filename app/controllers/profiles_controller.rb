class ProfilesController < ApplicationController
  before_action :find_profile, only: %i[show edit update]

  def show
    @bookings = @profile.bookings
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: 'Updated successfuly'
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :photo)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
