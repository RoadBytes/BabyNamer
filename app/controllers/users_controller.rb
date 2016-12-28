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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.update(current_user.id, user_params)
    if @user.errors.size.positive?
      flash.now[:notice] = 'Sorry something went wrong'
      render 'edit'
    else
      flash[:notice] = 'Profile Updated'
      redirect_to edit_user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation,
                                 :profile_pic)
  end
end
