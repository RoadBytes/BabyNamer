# BabyName controller
class BabyNamesController < ApplicationController
  before_action :set_baby_name, only: [:show, :edit, :update, :destroy]
  before_action :require_user,  only: [:edit, :update, :destroy]

  def index
    @baby_names = BabyName.all.sort_by(&:vote_count).reverse
  end

  def show; end

  def new
    @baby_name = BabyName.new
  end

  def edit; end

  def create
    @baby_name = BabyName.new(baby_name_params)

    if @baby_name.save
      redirect_to @baby_name, notice: 'Baby name was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    respond_to do |format|
      if @baby_name.update(baby_name_params)
        format.html do
          redirect_to @baby_name, notice: 'Baby name was successfully updated.'
        end
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @baby_name.destroy
    respond_to do |format|
      format.html { redirect_to baby_names_url }
    end
  end

  private

  def set_baby_name
    @baby_name = BabyName.find(params[:id])
  end

  def baby_name_params
    params.require(:baby_name).permit(:name, :background, :user_id)
  end
end
