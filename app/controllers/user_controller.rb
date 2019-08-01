class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "User Created Successfully"
      sign_in(user)
      redirect_to post_index_path
    else
      flash.now[:warning] = "User not created"
      redender "new"
    end
  end

  private def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end