# User controller
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      user_handle = @user.handle
      redirect_to root_path, notice: "Welcome #{user_handle}"
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
