# favorites controller
class FavoritesController < ApplicationController
  before_action :require_user
  before_action :set_baby_name

  def create
    current_user.favorites << @baby_name

    flash[:notice] = "#{@baby_name.name.capitalize} added to your favorites"
    redirect_to :back || baby_name_path(@baby_name)
  end

  def destroy
    current_user.favorites.delete(@baby_name)

    flash[:notice] = "#{@baby_name.name.capitalize} removed from your favorites"
    redirect_to :back || baby_name_path(@baby_name)
  end

  private

  def set_baby_name
    baby_name_id = favorite_params[:baby_name_id]
    @baby_name   = BabyName.find(baby_name_id)
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :baby_name_id)
  end
end
