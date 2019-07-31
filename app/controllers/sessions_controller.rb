class SessionsController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end
  
  def create
    user = User.find_by(email: params[:user][:email].downcase)
    if user && user == user.authenticate(params[:user][:password_digest])
      puts 'sdf'
      flash[:warning] = "Succesful login"
      sign_in(user)
      set_current_user(user)
      redirect_to sessions_path
    else
      flash.now[:warning] = "Wrong combination of email/password"
      render "new"
    end
  end

  def destroy
    sign_out
    flash[:warning] = "You have logged out correctly"
    redirect_to new_session_path
  end
end
