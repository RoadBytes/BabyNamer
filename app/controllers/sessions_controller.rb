class SessionsController < ApplicationController
  def new
  end

  def create
    email    = session_params[:email]
    password = session_params[:password]

    user = User.find_by(email: email)

    if user && user.authenticate(password)
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.handle}"
      redirect_to root_path
    else
      flash.now[:notice] = 'Error please try again'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success]   = "You've successfully logged out"
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
