# handles cookie sign in and out
class SessionsController < ApplicationController
  def new; end

  def create
    session_object    = UserSession.new(happy_path: root_path,
                                        error_path: new_session_path,
                                        input: session_params)
    session[:user_id] = session_object.id
    flash[:notice]    = session_object.message

    redirect_to session_object.path
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
