class BearsController < ApplicationController
  before_action :find_bear, only: %i[show edit destroy]
  # As a visitor I can display all bears
  def index
    @bears = Bear.all
  end

  # As a visitor I can display one bear's details
  def show
  end

  # As a renter I can create a new bear
  def new
    @bear = Bear.new
  end

  def create
    @bear = Bear.new(set_params)
    if @bear.save
      redirect_to bear_path(@bear)
    else
      render :new
    end
  end

  # As a renter I can edit info about my bear
  def edit
  end

  def update
    if @bear.update(set_params)
      redirect_to bear_path(@bear), notice: "Updated successfully"
    else
      render :new
    end
  end

  # As a renter I can delete a bear
  def destroy
    @bear.destroy
    redirect_to profile_path(@bear.profile)
  end

  private

  def set_params
    params.require(:bear).permit(:name, :personality, :description, :price)
  end

  def find_bear
    @bear = Bear.find(params[:id])
  end
end
