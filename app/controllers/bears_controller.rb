class BearsController < ApplicationController
  before_action :find_bear, only: %i[show edit destroy update]
  skip_before_action :authenticate_user!, only: %i[index show]
  # As a visitor I can display all bears
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR personality ILIKE :query OR description ILIKE :query"
      @bears = Bear.where(sql_query, query: "%#{params[:query]}%")
    else
      @bears = Bear.all
    end
  end

  # As a visitor I can display one bear's details
  def show
    @booking = Booking.new
    @favourite = current_user.favourites.where(bear_id: @bear.id).first
  end

  # As a renter I can create a new bear
  def new
    @bear = Bear.new
  end

  def create
    @bear = Bear.new(bear_params)
    @bear.user = current_user
    if @bear.save
      redirect_to bear_path(@bear)
    else
      render :new, notice: "Oops. Something went wrong..."
    end
  end

  # As a renter I can edit info about my bear
  def edit
  end

  def update
    if @bear.update(bear_params)
      redirect_to bear_path(@bear), notice: "Updated successfully"
    else
      render :new
    end
  end

  # As a renter I can delete a bear
  def destroy
    @bear.destroy
    redirect_to profile_path(@bear.profile), status: :unprocessable_entity
  end

  private

  def bear_params
    params.require(:bear).permit(:name, :personality, :description, :price, :photo)
  end

  def find_bear
    @bear = Bear.find(params[:id])
  end
end
