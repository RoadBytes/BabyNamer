# User controller
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    id    = params[:id].to_i
    @user = User.find(id)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome #{@user.handle}"
    else
      render action: 'new'
    end
  end

  def edit; end

  def update; end

  private

  def user_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation)
  end
end
