class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "User Created Successfully"
      sign_in(user)
      redirect_to root_path
    else
      flash.now[:warning] = "There was a problem creating the user, please try again later"
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end