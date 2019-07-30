class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.find_by(email: params[:user][:email].downcase)
    if user && user.authenticate(params[:user][:password])
      # Sends Somewhere
    else
      render "new"
    end
  end
end
