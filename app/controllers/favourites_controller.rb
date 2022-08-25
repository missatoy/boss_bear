class FavouritesController < ApplicationController
  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @bear = Bear.find(params[:bear_id])
    @favourite.bear = @bear
    if @favourite.save
      redirect_to bear_path(@bear, anchor: "favourite"), status: :see_other, notice: "Added successfully"
    else
      render :new, notice: "Oops. Something went wrong...", status: :unprocessable_entity
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to bear_path(@favourite.bear), status: :unprocessable_entity, notice: "Removed successfully"
  end
end
